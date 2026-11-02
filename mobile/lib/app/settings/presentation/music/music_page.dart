import 'dart:io';

import 'package:moodiary_components/moodiary_components.dart';
import 'package:moodiary_di/moodiary_di.dart';
import 'package:moodiary_files/moodiary_files.dart';
import 'package:moodiary_i18n/moodiary_i18n.dart';
import 'package:moodiary_logging/moodiary_logging.dart';
import 'package:moodiary_music/moodiary_music.dart';
import 'package:mui/mui.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});
  @override State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  MusicController? get _music => getIt.maybeGet<MusicController>();
  bool _retrying = false;

  Future<void> _retry() async {
    if (_retrying) return;
    setState(() => _retrying = true);
    try {
      final music = await MusicController.create();
      getIt.registerSingleton<MusicController>(music);
      MediaPlaybackCoordinator.registerMusicPause(music.pause);
      if (mounted) setState(() {});
    } catch (e, s) {
      logger.e('music retry failed', error: e, stackTrace: s);
      if (mounted) toast.error(message: context.l10n.dream.musicPlaybackError);
    } finally { if (mounted) setState(() => _retrying = false); }
  }

  Future<void> _add(MusicController music) async {
    try {
      final files = await getIt<IFilePicker>().pickAudioFiles();
      if (files.isEmpty || !mounted) return;
      final count = await music.importFiles(files);
      if (!mounted) return;
      if (count > 0) toast.success(message: context.l10n.dream.musicImported(count: count));
      if (count < files.length) toast.error(message: context.l10n.dream.musicImportError);
    } catch (e, s) {
      logger.e('music picker failed', error: e, stackTrace: s);
      if (mounted) toast.error(message: context.l10n.dream.musicImportError);
    }
  }

  Future<void> _remove(MusicController music, MusicTrack track) async {
    final ok = await MAlert.confirm(context, title: context.l10n.dream.musicRemove,
      message: context.l10n.dream.musicRemoveMessage(title: track.title), isDestructive: true);
    if (!ok || !mounted) return;
    try { await music.remove(track); }
    catch (e, s) {
      logger.e('music remove failed', error: e, stackTrace: s);
      if (mounted) toast.error(message: context.l10n.dream.musicPlaybackError);
    }
  }

  String _time(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return d.inHours > 0 ? '${d.inHours}:$m:$s' : '$m:$s';
  }

  @override Widget build(BuildContext context) {
    final t = context.l10n.dream;
    final music = _music;
    return Scaffold(appBar: AppBar(title: Text(t.musicTitle)), body: !Platform.isAndroid
      ? Center(child: Text(t.musicAndroidOnly))
      : music == null ? Center(child: Padding(padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(t.musicPlaybackError, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: _retrying ? null : _retry, child: Text(context.l10n.common.retry)),
          ])))
      : ListenableBuilder(listenable: music, builder: (context, _) => _buildContent(music)));
  }

  Widget _buildContent(MusicController music) {
    final t = context.l10n.dream;
    final current = music.current;
    final total = music.duration.inMilliseconds.toDouble();
    final position = music.position.inMilliseconds.toDouble().clamp(0.0, total > 0 ? total : 1.0);
    return ListView(padding: const EdgeInsets.all(16), children: [
      Text(t.musicDescription, style: context.theme.typography.bodyMedium.onSurfaceVariant),
      const SizedBox(height: 8),
      SwitchListTile(title: Text(t.musicEnabled), value: music.enabled,
        onChanged: music.setEnabled),
      SwitchListTile(title: Text(t.musicBackground), subtitle: Text(t.musicBackgroundHint),
        value: music.background, onChanged: music.enabled ? music.setBackground : null),
      if (music.error != null) Card.filled(color: context.theme.colors.errorContainer,
        child: Padding(padding: const EdgeInsets.all(12), child: Text(switch (music.error) {
          'import' => t.musicImportError, 'playlist' => t.musicPlaylistError, _ => t.musicPlaybackError,
        }, style: context.theme.typography.bodyMedium.onErrorContainer))),
      const SizedBox(height: 12),
      FilledButton.icon(onPressed: music.importing || !music.enabled ? null : () => _add(music),
        icon: music.importing ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
          : const Icon(LucideIcons.plus), label: Text(music.importing ? t.musicImporting : t.musicAdd)),
      const SizedBox(height: 20),
      if (current != null) Card.filled(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
        Icon(LucideIcons.music, size: 40, color: context.theme.colors.primary),
        const SizedBox(height: 12),
        Text(current.title, textAlign: TextAlign.center, style: context.theme.typography.titleMedium.emphasized.onSurface),
        if (current.artist?.isNotEmpty == true || current.album?.isNotEmpty == true)
          Text([current.artist, current.album].whereType<String>().where((s) => s.isNotEmpty).join(' · '),
            textAlign: TextAlign.center, style: context.theme.typography.bodySmall.onSurfaceVariant),
        Slider(value: position, max: total > 0 ? total : 1,
          onChanged: total > 0 ? (v) => music.seek(Duration(milliseconds: v.round())) : null),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(_time(music.position)), Text(_time(music.duration))]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(tooltip: t.musicPrevious, onPressed: music.skipToPrevious, icon: const Icon(LucideIcons.skipBack)),
          IconButton.filled(tooltip: music.playing ? t.musicPause : t.musicPlay,
            onPressed: music.enabled ? (music.playing ? music.pause : music.play) : null,
            icon: Icon(music.playing ? LucideIcons.pause : LucideIcons.play)),
          IconButton(tooltip: t.musicNext, onPressed: music.skipToNext, icon: const Icon(LucideIcons.skipForward)),
          IconButton(tooltip: t.musicStop, onPressed: music.stop, icon: const Icon(LucideIcons.square)),
        ]),
        Row(children: [const Icon(LucideIcons.volume2), Expanded(child: Slider(value: music.volume,
          onChanged: music.setVolume)), Text('${(music.volume * 100).round()}%')]),
        SwitchListTile(title: Text(t.musicShuffle), value: music.shuffle, onChanged: music.setShuffle),
        ListTile(title: Text(t.musicRepeat), trailing: DropdownButton<MusicRepeat>(value: music.repeat,
          onChanged: (v) { if (v != null) music.setRepeat(v); }, items: [
            DropdownMenuItem(value: MusicRepeat.off, child: Text(t.musicRepeatOff)),
            DropdownMenuItem(value: MusicRepeat.all, child: Text(t.musicRepeatAll)),
            DropdownMenuItem(value: MusicRepeat.one, child: Text(t.musicRepeatOne)),
          ])),
      ]))) else Padding(padding: const EdgeInsets.all(24), child: Text(t.musicEmpty, textAlign: TextAlign.center)),
      const SizedBox(height: 16),
      for (var i = 0; i < music.tracks.length; i++) _TrackTile(music: music, track: music.tracks[i],
        selected: i == music.index, onTap: () => music.select(i), onRemove: () => _remove(music, music.tracks[i])),
      const SizedBox(height: 16),
      Text(t.musicNoAutoplay, style: context.theme.typography.bodySmall.onSurfaceVariant),
      const SizedBox(height: 8),
      Text(t.musicPrivacy, style: context.theme.typography.bodySmall.onSurfaceVariant),
    ]);
  }
}

class _TrackTile extends StatelessWidget {
  const _TrackTile({required this.music, required this.track, required this.selected,
    required this.onTap, required this.onRemove});
  final MusicController music; final MusicTrack track; final bool selected;
  final VoidCallback onTap, onRemove;
  @override Widget build(BuildContext context) => FutureBuilder<bool>(
    future: music.available(track), builder: (context, snapshot) {
      final available = snapshot.data ?? true;
      return ListTile(selected: selected, leading: Icon(available ? LucideIcons.music : LucideIcons.fileWarning),
        title: Text(track.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(available ? [track.artist, if (track.durationMs != null)
          '${Duration(milliseconds: track.durationMs!).inMinutes}:${(Duration(milliseconds: track.durationMs!).inSeconds % 60).toString().padLeft(2, '0')}']
          .whereType<String>().where((s) => s.isNotEmpty).join(' · ') : context.l10n.dream.musicUnavailable),
        onTap: available ? onTap : null,
        trailing: IconButton(tooltip: context.l10n.dream.musicRemove, onPressed: onRemove, icon: const Icon(LucideIcons.trash2)));
    });
}
