import 'package:flutter_test/flutter_test.dart';
import 'package:moodiary_music/src/music_resume_policy.dart';

void main() {
  group('MusicResumePolicy cold start', () {
    test('waits for PIN unlock, then starts the saved track from zero once', () {
      final policy = MusicResumePolicy()..scheduleColdStart();
      expect(policy.hasPending, isTrue);
      expect(
        policy.consume(locked: true, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
      expect(policy.hasPending, isTrue);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.fromBeginning,
      );
      expect(policy.hasPending, isFalse);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
    });

    test('disabled music cancels the pending cold start', () {
      final policy = MusicResumePolicy()..scheduleColdStart();
      expect(
        policy.consume(locked: false, enabled: false, hasTracks: true),
        MusicAutoStart.none,
      );
      expect(policy.hasPending, isFalse);
    });

    test('empty playlist cancels the pending cold start', () {
      final policy = MusicResumePolicy()..scheduleColdStart();
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: false),
        MusicAutoStart.none,
      );
      expect(policy.hasPending, isFalse);
    });
  });

  group('MusicResumePolicy lifecycle', () {
    test('a track that was playing resumes from its paused position once', () {
      final policy = MusicResumePolicy()
        ..onLifecyclePause(wasPlaying: true);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.resumePosition,
      );
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
    });

    test('a track that was already paused does not auto-resume', () {
      final policy = MusicResumePolicy()
        ..onLifecyclePause(wasPlaying: false);
      expect(policy.hasPending, isFalse);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
    });

    test('lifecycle resume also waits for PIN unlock', () {
      final policy = MusicResumePolicy()
        ..onLifecyclePause(wasPlaying: true);
      expect(
        policy.consume(locked: true, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
      expect(policy.hasPending, isTrue);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.resumePosition,
      );
    });

    test('background playback keeps no lifecycle resume pending', () {
      final policy = MusicResumePolicy()
        ..onLifecyclePause(wasPlaying: true)
        ..cancelLifecycleResume();
      expect(policy.hasPending, isFalse);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
    });
  });

  group('MusicResumePolicy cancellation', () {
    test('manual stop/play/settings cancellation clears every pending start', () {
      final policy = MusicResumePolicy()
        ..scheduleColdStart()
        ..onLifecyclePause(wasPlaying: true)
        ..cancel();
      expect(policy.hasPending, isFalse);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.none,
      );
    });

    test('manual pause clears only the lifecycle resume, not a cold start', () {
      final policy = MusicResumePolicy()
        ..scheduleColdStart()
        ..onLifecyclePause(wasPlaying: true)
        ..cancelLifecycleResume();
      expect(policy.hasPending, isTrue);
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.fromBeginning,
      );
    });

    test('a new cold start supersedes an older lifecycle resume', () {
      final policy = MusicResumePolicy()
        ..onLifecyclePause(wasPlaying: true)
        ..scheduleColdStart();
      expect(
        policy.consume(locked: false, enabled: true, hasTracks: true),
        MusicAutoStart.fromBeginning,
      );
      expect(policy.hasPending, isFalse);
    });
  });
}
