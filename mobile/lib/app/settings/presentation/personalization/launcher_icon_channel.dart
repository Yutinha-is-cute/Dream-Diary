import 'package:flutter/services.dart';

/// Narrow bridge to Android PackageManager / ShortcutManager.
class LauncherIconChannel {
  const LauncherIconChannel();
  static const _channel = MethodChannel('dream_diary/launcher');
  static const presets = {'dream', 'mono', 'plum'};

  Future<String> getPreset() async =>
      await _channel.invokeMethod<String>('getPreset') ?? 'dream';

  Future<void> setPreset(String preset) async {
    if (!presets.contains(preset)) throw ArgumentError.value(preset);
    await _channel.invokeMethod<void>('setPreset', {'preset': preset});
  }

  /// Returns false when the launcher declines/does not support pin requests.
  Future<bool> pinShortcut(String imagePath) async =>
      await _channel.invokeMethod<bool>('pinShortcut', {'path': imagePath}) ?? false;

  Future<bool> isShortcutPinned() async =>
      await _channel.invokeMethod<bool>('isShortcutPinned') ?? false;

  Future<void> disableShortcut() => _channel.invokeMethod<void>('disableShortcut');
}
