import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:mui/mui.dart';

/// Historical API name retained for source compatibility; displays Dream Diary.
class MoodiaryLogo extends StatelessWidget {
  final double size;
  final Brightness? brightness;
  const MoodiaryLogo({super.key, this.size = 48, this.brightness});
  static const _asset = 'packages/moodiary_components/assets/brand/dream_diary.png';
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: .circular(size * .18),
    child: Image.asset(_asset, width: size, height: size, fit: .cover),
  );
  static ui.Image? _cached;
  static Future<ui.Image?> rasterize({required Brightness brightness, required int pixels}) async {
    if (_cached != null) return _cached;
    try {
      final bytes = await rootBundle.load(_asset);
      final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List(), targetWidth: pixels, targetHeight: pixels);
      final frame = await codec.getNextFrame();
      codec.dispose();
      return _cached = frame.image;
    } catch (_) { return null; }
  }
}
