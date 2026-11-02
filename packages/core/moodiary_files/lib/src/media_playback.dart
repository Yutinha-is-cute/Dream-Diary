/// Process-local coordination between diary audio/recording and the music theme.
/// Keeps feature packages independent: the app registers the music pause action.
abstract final class MediaPlaybackCoordinator {
  static Future<void> Function()? _pauseMusic;
  static void registerMusicPause(Future<void> Function()? action) => _pauseMusic = action;
  static Future<void> pauseMusic() async {
    try { await _pauseMusic?.call(); } catch (_) { /* focus API still guards playback */ }
  }
}
