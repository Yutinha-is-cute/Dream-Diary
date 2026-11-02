import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moodiary_mobile/app/settings/presentation/personalization/launcher_icon_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = LauncherIconChannel();
  test('rejects arbitrary preset before reaching native code', () async {
    await expectLater(channel.setPreset('../../MainActivity'), throwsArgumentError);
  });
  test('reads native preset and pin result', () async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('dream_diary/launcher'), (call) async {
        calls.add(call);
        return switch (call.method) { 'getPreset' => 'plum', 'pinShortcut' => true, _ => null };
      });
    addTearDown(() => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(const MethodChannel('dream_diary/launcher'), null));
    expect(await channel.getPreset(), 'plum');
    expect(await channel.pinShortcut('/private/shortcut.png'), isTrue);
    expect(calls.map((c) => c.method), ['getPreset', 'pinShortcut']);
  });
}
