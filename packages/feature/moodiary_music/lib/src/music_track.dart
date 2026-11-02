import 'package:path/path.dart' as p;

/// A private copy. Never stores a transient SAF/cache URI.
class MusicTrack {
  const MusicTrack({required this.id, required this.fileName, required this.title,
    this.artist, this.album, this.durationMs, required this.bytes});
  final String id;
  final String fileName;
  final String title;
  final String? artist;
  final String? album;
  final int? durationMs;
  final int bytes;

  static final supportedExtensions = <String>{
    '.mp3', '.m4a', '.aac', '.ogg', '.opus', '.flac', '.wav', '.webm',
  };
  static bool isSupported(String name) =>
      supportedExtensions.contains(p.extension(name).toLowerCase());
  static String? validateFileName(String name) =>
      name.isEmpty || name != p.basename(name) || name.contains('..') ? null : name;

  Map<String, dynamic> toJson() => {
    'id': id, 'fileName': fileName, 'title': title,
    if (artist != null) 'artist': artist,
    if (album != null) 'album': album,
    if (durationMs != null) 'durationMs': durationMs,
    'bytes': bytes,
  };
  factory MusicTrack.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final fileName = validateFileName(json['fileName'] as String);
    if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(id) || fileName == null) {
      throw const FormatException('Invalid music track path');
    }
    return MusicTrack(id: id, fileName: fileName,
      title: (json['title'] as String?)?.trim().isNotEmpty == true
          ? json['title'] as String : p.basenameWithoutExtension(fileName),
      artist: json['artist'] as String?, album: json['album'] as String?,
      durationMs: (json['durationMs'] as num?)?.toInt(),
      bytes: (json['bytes'] as num).toInt());
  }
}

enum MusicRepeat { off, all, one }

/// Pure policy used by the player and regression tests.
int nextMusicIndex({required int current, required int length,
    required MusicRepeat repeat, required bool forward}) {
  if (length <= 0) return -1;
  if (repeat == MusicRepeat.one) return current.clamp(0, length - 1);
  final next = current + (forward ? 1 : -1);
  if (next >= 0 && next < length) return next;
  if (repeat != MusicRepeat.all) return -1;
  return forward ? 0 : length - 1;
}
