import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:moodiary_files/moodiary_files.dart';
import 'package:moodiary_logging/moodiary_logging.dart';
import 'package:moodiary_platform/moodiary_platform.dart';
import 'package:moodiary_storage/moodiary_storage.dart';
import 'package:moodiary_utils/moodiary_utils.dart';
import 'package:path/path.dart' as p;
import 'package:synchronized/synchronized.dart';

import 'music_resume_policy.dart';
import 'music_track.dart';

/// One player, one media session. Automatic starts are decided by
/// [MusicResumePolicy]; the player itself is unchanged.
class MusicController extends BaseAudioHandler with ChangeNotifier {
  MusicController._(this.directory) : _player = AudioPlayer(maxSkipsOnError: 1000);
  final Directory directory;
  final AudioPlayer _player;
  final _lock = Lock();
  final MusicResumePolicy _resumePolicy = MusicResumePolicy();
  final _subs = <StreamSubscription<dynamic>>[];
  List<MusicTrack> tracks = [];
  bool ready = false;
  bool importing = false;
  String? error;
  int index = 0;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool playing = false;
  late bool enabled = MoodiaryKVs.musicEnabled.get()!;
  late bool background = MoodiaryKVs.musicBackground.get()!;
  late bool shuffle = MoodiaryKVs.musicShuffle.get()!;
  late double volume = MoodiaryKVs.musicVolume.get()!.clamp(0.0, 1.0);
  late MusicRepeat repeat = MusicRepeat.values[MoodiaryKVs.musicRepeat.get()!.clamp(0, 2)];
  int _loadGeneration = 0;
  bool _disposed = false;
  Timer? _persistTimer;

  static Future<MusicController> create({bool coldStart = false}) async {
    final dir = Directory(p.join(PlatformService.get().applicationSupportPath,
        'dream_diary', 'music'));
    final controller = MusicController._(dir);
    await controller._init(coldStart: coldStart);
    return controller;
  }

  Future<void> _init({bool coldStart = false}) async {
    await directory.create(recursive: true);
    try {
      final file = File(p.join(directory.path, 'playlist.json'));
      if (await file.exists()) {
        final json = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
        if (json['version'] != 1) throw const FormatException('Playlist version');
        tracks = (json['tracks'] as List).map((e) =>
            MusicTrack.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      }
    } catch (e, s) {
      // Preserve corrupt metadata for diagnosis; never delete the audio copies.
      error = 'playlist';
      logger.e('music playlist load failed', error: e, stackTrace: s);
    }
    index = MoodiaryKVs.musicIndex.get()!.clamp(0, tracks.isEmpty ? 0 : tracks.length - 1);
    // A cold app start keeps the selected track but deliberately ignores the
    // pre-close position. Warm lifecycle pauses keep using the live position.
    position = coldStart
        ? Duration.zero
        : Duration(milliseconds: MoodiaryKVs.musicPositionMs.get()!.clamp(0, 1 << 62));
    if (coldStart) MoodiaryKVs.musicPositionMs.set(0);
    await AudioService.init(builder: () => this, config: const AudioServiceConfig(
      androidNotificationChannelId: 'cn.yooss.moodiary.music',
      androidNotificationChannelName: 'Dream Diary · Tema musical',
      androidNotificationIcon: 'drawable/ic_music_notification',
      androidNotificationClickStartsActivity: true,
      androidStopForegroundOnPause: true,
      androidResumeOnClick: false,
    ));
    _subs.addAll([
      _player.playbackEventStream.listen(_onPlayback, onError: (Object e) {
        error = 'playback'; playing = false; notifyListeners();
      }),
      _player.currentIndexStream.listen((i) {
        if (i == null || i < 0 || i >= tracks.length) return;
        index = i; MoodiaryKVs.musicIndex.set(i); _publishItem(); notifyListeners();
      }),
      _player.positionStream.listen((value) { position = value; }),
      _player.durationStream.listen((value) { duration = value ?? Duration.zero; }),
    ]);
    await _player.setVolume(volume);
    await _player.setShuffleModeEnabled(shuffle);
    await _player.setLoopMode(_loopMode);
    await _reload(preload: false);
    if (tracks.isNotEmpty) await _player.seek(position, index: index);
    if (coldStart) _resumePolicy.scheduleColdStart();
    _persistTimer = Timer.periodic(const Duration(seconds: 5), (_) => persistPosition());
    ready = true;
    notifyListeners();
  }

  LoopMode get _loopMode => switch (repeat) {
    MusicRepeat.off => LoopMode.off,
    MusicRepeat.all => LoopMode.all,
    MusicRepeat.one => LoopMode.one,
  };
  MusicTrack? get current => tracks.isEmpty ? null : tracks[index.clamp(0, tracks.length - 1)];
  String pathFor(MusicTrack track) => p.join(directory.path, track.fileName);
  Future<bool> available(MusicTrack track) => File(pathFor(track)).exists();

  Future<void> _savePlaylist() async {
    final tmp = File(p.join(directory.path, 'playlist.json.tmp'));
    await tmp.writeAsString(jsonEncode({'version': 1, 'tracks': tracks.map((e) => e.toJson()).toList()}), flush: true);
    await tmp.rename(p.join(directory.path, 'playlist.json'));
  }

  Future<void> _reload({bool preload = true, bool? wantPlaying}) async {
    final generation = ++_loadGeneration;
    final resume = wantPlaying ?? playing;
    final selected = index;
    final at = position;
    if (tracks.isEmpty) { await _player.stop(); queue.add([]); mediaItem.add(null); return; }
    final sources = tracks.map((t) => AudioSource.file(pathFor(t), tag: t.id)).toList();
    try {
      await _player.setAudioSources(sources, preload: preload,
          initialIndex: selected.clamp(0, sources.length - 1), initialPosition: at);
      if (generation != _loadGeneration || _disposed) return;
      await _player.setShuffleModeEnabled(shuffle);
      await _player.setLoopMode(_loopMode);
      queue.add(tracks.map((t) => MediaItem(id: t.id, title: t.title,
          artist: t.artist, album: t.album,
          duration: t.durationMs == null ? null : Duration(milliseconds: t.durationMs!))).toList());
      _publishItem();
      if (resume && enabled) await _player.play();
    } on PlayerInterruptedException { return; }
    catch (e, s) {
      error = 'playback'; playing = false;
      logger.e('music load failed', error: e, stackTrace: s);
      notifyListeners();
    }
  }

  void _publishItem() {
    final t = current;
    mediaItem.add(t == null ? null : MediaItem(id: t.id, title: t.title,
        artist: t.artist, album: t.album,
        duration: t.durationMs == null ? null : Duration(milliseconds: t.durationMs!)));
  }
  void _onPlayback(PlaybackEvent event) {
    if (_disposed) return;
    playing = _player.playing;
    position = _player.position;
    duration = _player.duration ?? duration;
    playbackState.add(playbackState.value.copyWith(
      controls: [MediaControl.skipToPrevious,
        playing ? MediaControl.pause : MediaControl.play,
        MediaControl.stop, MediaControl.skipToNext],
      systemActions: const {MediaAction.seek},
      androidCompactActionIndices: const [0, 1, 3],
      processingState: switch (_player.processingState) {
        ProcessingState.idle => AudioProcessingState.idle,
        ProcessingState.loading => AudioProcessingState.loading,
        ProcessingState.buffering => AudioProcessingState.buffering,
        ProcessingState.ready => AudioProcessingState.ready,
        ProcessingState.completed => AudioProcessingState.completed,
      },
      playing: playing, updatePosition: position, queueIndex: index,
      repeatMode: switch (repeat) { MusicRepeat.off => AudioServiceRepeatMode.none,
        MusicRepeat.all => AudioServiceRepeatMode.all, MusicRepeat.one => AudioServiceRepeatMode.one },
      shuffleMode: shuffle ? AudioServiceShuffleMode.all : AudioServiceShuffleMode.none,
    ));
    notifyListeners();
  }

  @override Future<void> play() async {
    // A manual play replaces any pending automatic start.
    _resumePolicy.cancel();
    if (!enabled || tracks.isEmpty) return;
    error = null;
    try {
      if (_player.processingState == ProcessingState.idle) await _reload(wantPlaying: false);
      // A deleted private copy must not stall the whole playlist.
      for (var attempt = 0; attempt < tracks.length; attempt++) {
        final track = current;
        if (track != null && await available(track)) break;
        final next = (index + 1) % tracks.length;
        await _player.seek(Duration.zero, index: next);
      }
      await _player.play();
    } catch (_) { error = 'playback'; notifyListeners(); }
  }
  @override Future<void> pause() async {
    _resumePolicy.cancelLifecycleResume();
    await _player.pause(); await persistPosition();
  }
  @override Future<void> stop() async {
    _resumePolicy.cancel();
    await pause(); await _player.stop(); await super.stop();
  }
  @override Future<void> skipToNext() async {
    if (repeat == MusicRepeat.all && !_player.hasNext) {
      await _player.seek(Duration.zero, index: _player.effectiveIndices.first);
    } else { await _player.seekToNext(); }
  }
  @override Future<void> skipToPrevious() async {
    if (position > const Duration(seconds: 3)) { await seek(Duration.zero); return; }
    if (repeat == MusicRepeat.all && !_player.hasPrevious) {
      await _player.seek(Duration.zero, index: _player.effectiveIndices.last);
    } else { await _player.seekToPrevious(); }
  }
  @override Future<void> seek(Duration position) => _player.seek(position);
  @override Future<void> onTaskRemoved() => stop();
  @override Future<void> onNotificationDeleted() => stop();
  @override Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) =>
      setRepeat(switch (repeatMode) { AudioServiceRepeatMode.one => MusicRepeat.one,
        AudioServiceRepeatMode.none => MusicRepeat.off, _ => MusicRepeat.all });
  @override Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) => setShuffle(shuffleMode != AudioServiceShuffleMode.none);

  Future<void> select(int value) => _lock.synchronized(() async {
    if (value < 0 || value >= tracks.length) return;
    index = value; position = Duration.zero;
    MoodiaryKVs.musicIndex.set(index); MoodiaryKVs.musicPositionMs.set(0);
    await _player.seek(Duration.zero, index: index); notifyListeners();
  });
  Future<void> setVolume(double value) async {
    volume = value.clamp(0, 1); MoodiaryKVs.musicVolume.set(volume);
    await _player.setVolume(volume); notifyListeners();
  }
  Future<void> setShuffle(bool value) async {
    shuffle = value; MoodiaryKVs.musicShuffle.set(value);
    await _player.setShuffleModeEnabled(value); notifyListeners();
  }
  Future<void> setRepeat(MusicRepeat value) async {
    repeat = value; MoodiaryKVs.musicRepeat.set(value.index);
    await _player.setLoopMode(_loopMode); notifyListeners();
  }
  Future<void> setEnabled(bool value) async {
    enabled = value; MoodiaryKVs.musicEnabled.set(value);
    if (!value) { _resumePolicy.cancel(); await pause(); }
    notifyListeners();
  }
  Future<void> setBackground(bool value) async {
    background = value; MoodiaryKVs.musicBackground.set(value);
    if (!value) await pause(); notifyListeners();
  }
  Future<void> onAppPaused() async {
    final wasPlaying = playing;
    await persistPosition();
    if (!background) {
      await pause();
      _resumePolicy.onLifecyclePause(wasPlaying: wasPlaying);
    } else {
      _resumePolicy.cancelLifecycleResume();
    }
  }

  /// Called when the app returns to the foreground or the PIN gate is cleared.
  /// A cold start replays the saved track from zero; a warm lifecycle pause
  /// continues from the paused position. Background playback is untouched.
  Future<void> onAppResumed({required bool locked}) async {
    if (!ready || _disposed) return;
    final action = _resumePolicy.consume(
      locked: locked, enabled: enabled, hasTracks: tracks.isNotEmpty);
    if (action == MusicAutoStart.fromBeginning) {
      await seek(Duration.zero);
      await play();
    } else if (action == MusicAutoStart.resumePosition) {
      await play();
    }
  }

  /// SAF picker supplies a readable stream; copy it, never the user's original.
  Future<int> importFiles(List<XFile> files) => _lock.synchronized(() async {
    importing = true; error = null; notifyListeners();
    final added = <MusicTrack>[];
    const maxBytes = 200 * 1024 * 1024;
    try {
      for (final file in files) {
        File? temporary;
        try {
          if (!MusicTrack.isSupported(file.name)) throw const FormatException('extension');
          final size = await file.length();
          if (size <= 0 || size > maxBytes) throw const FormatException('size');
          final id = uuidV7();
          final name = '$id${p.extension(file.name).toLowerCase()}';
          temporary = File(p.join(directory.path, '$name.part'));
          var written = 0;
          final sink = temporary.openWrite();
          try {
            await for (final chunk in file.openRead()) {
              written += chunk.length;
              if (written > maxBytes) throw const FormatException('size');
              sink.add(chunk);
              if (written % (4 * 1024 * 1024) < chunk.length) await sink.flush();
            }
            await sink.flush();
          } finally { await sink.close(); }
          final destination = File(p.join(directory.path, name));
          await temporary.rename(destination.path);
          temporary = null;
          final metadata = await _readMetadata(destination.path);
          added.add(MusicTrack(id: id, fileName: name,
              title: metadata?.title?.trim().isNotEmpty == true ? metadata!.title! : p.basenameWithoutExtension(file.name),
              artist: metadata?.artist, album: metadata?.album,
              durationMs: metadata?.duration?.inMilliseconds, bytes: written));
        } catch (e) {
          error = 'import'; logger.e('music import rejected: ${file.name}', error: e);
          try { if (temporary != null && await temporary.exists()) await temporary.delete(); } catch (_) {}
        }
      }
      if (added.isNotEmpty) {
        final wasEmpty = tracks.isEmpty;
        tracks = [...tracks, ...added];
        await _savePlaylist();
        await _reload(preload: false, wantPlaying: !wasEmpty && playing);
      }
      return added.length;
    } finally { importing = false; notifyListeners(); }
  });

  Future<_Metadata?> _readMetadata(String path) async {
    // Reuse the app's metadata parser, isolated so malformed/large tags cannot block UI.
    try {
      return await Isolate.run(() async {
        final m = readMetadata(File(path), getImage: false);
        return _Metadata(title: m.title, artist: m.artist, album: m.album, duration: m.duration);
      });
    } catch (_) {
      final duration = await probeAudioDuration(path);
      return duration == null ? null : _Metadata(duration: duration);
    }
  }

  Future<void> remove(MusicTrack track) => _lock.synchronized(() async {
    final at = tracks.indexWhere((t) => t.id == track.id);
    if (at < 0) return;
    final resume = playing;
    tracks = List.of(tracks)..removeAt(at);
    if (at < index) index--;
    index = index.clamp(0, tracks.isEmpty ? 0 : tracks.length - 1);
    position = Duration.zero;
    await _savePlaylist();
    MoodiaryKVs.musicIndex.set(index); MoodiaryKVs.musicPositionMs.set(0);
    await _reload(preload: false, wantPlaying: resume);
    try { await File(pathFor(track)).delete(); } on PathNotFoundException { /* already gone */ }
    notifyListeners();
  });

  Future<void> persistPosition() async {
    MoodiaryKVs.musicIndex.set(index);
    MoodiaryKVs.musicPositionMs.set(position.inMilliseconds);
  }
  @override
  Future<void> dispose() async {
    if (_disposed) return; _disposed = true; _loadGeneration++;
    _persistTimer?.cancel();
    await persistPosition();
    for (final sub in _subs) { await sub.cancel(); }
    await _player.dispose(); super.dispose();
  }
}

class _Metadata {
  const _Metadata({this.title, this.artist, this.album, this.duration});
  final String? title; final String? artist; final String? album; final Duration? duration;
}
