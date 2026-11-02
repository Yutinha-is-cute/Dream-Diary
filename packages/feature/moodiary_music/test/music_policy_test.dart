import 'package:flutter_test/flutter_test.dart';
import 'package:moodiary_music/moodiary_music.dart';

void main() {
  test('track manifest round trip and path traversal rejection', () {
    const track = MusicTrack(id: 'abc_123', fileName: 'abc_123.mp3', title: 'Canção', bytes: 100);
    expect(MusicTrack.fromJson(track.toJson()).title, 'Canção');
    expect(() => MusicTrack.fromJson({...track.toJson(), 'fileName': '../secret.mp3'}), throwsFormatException);
    expect(MusicTrack.validateFileName('/tmp/a.mp3'), isNull);
    expect(MusicTrack.isSupported('SONG.M4A'), isTrue);
    expect(MusicTrack.isSupported('song.exe'), isFalse);
  });
  test('repeat and manual navigation boundaries', () {
    expect(nextMusicIndex(current: 2, length: 3, repeat: MusicRepeat.off, forward: true), -1);
    expect(nextMusicIndex(current: 2, length: 3, repeat: MusicRepeat.all, forward: true), 0);
    expect(nextMusicIndex(current: 0, length: 3, repeat: MusicRepeat.all, forward: false), 2);
    expect(nextMusicIndex(current: 1, length: 3, repeat: MusicRepeat.one, forward: true), 1);
    expect(nextMusicIndex(current: 0, length: 0, repeat: MusicRepeat.all, forward: true), -1);
  });
}
