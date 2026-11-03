/// Pure decision state for automatic music starts.
///
/// The player itself is unchanged; this only distinguishes a cold app start
/// (same track, from the beginning, after unlock if PIN is enabled) from a
/// normal lifecycle pause/resume (continue from the paused position).
enum MusicAutoStart { none, fromBeginning, resumePosition }

class MusicResumePolicy {
  bool _coldStartPending = false;
  bool _lifecycleResumePending = false;

  bool get hasPending => _coldStartPending || _lifecycleResumePending;

  /// Called once when a new controller is created during app bootstrap.
  void scheduleColdStart() {
    _coldStartPending = true;
    _lifecycleResumePending = false;
  }

  /// Called when the app goes to background with background playback disabled.
  /// Only a track that was actually playing should resume on return.
  void onLifecyclePause({required bool wasPlaying}) {
    _lifecycleResumePending = wasPlaying;
  }

  /// Manual pause/stop/settings changes must not create an automatic resume.
  void cancel() {
    _coldStartPending = false;
    _lifecycleResumePending = false;
  }

  void cancelLifecycleResume() => _lifecycleResumePending = false;

  /// Consumes at most one pending automatic start.
  MusicAutoStart consume({
    required bool locked,
    required bool enabled,
    required bool hasTracks,
  }) {
    if (locked) return MusicAutoStart.none;
    if (!enabled || !hasTracks) {
      cancel();
      return MusicAutoStart.none;
    }
    if (_coldStartPending) {
      _coldStartPending = false;
      return MusicAutoStart.fromBeginning;
    }
    if (_lifecycleResumePending) {
      _lifecycleResumePending = false;
      return MusicAutoStart.resumePosition;
    }
    return MusicAutoStart.none;
  }
}
