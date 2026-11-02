import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui' show Offset, Rect;

/// Shared by the preview and the exported 512px bitmap; coordinates are normalized.
class IconCrop {
  const IconCrop({required this.imageWidth, required this.imageHeight,
    this.zoom = 1, this.offsetX = 0, this.offsetY = 0});
  final double imageWidth, imageHeight, zoom, offsetX, offsetY;

  double get sourceSide => math.min(imageWidth, imageHeight) / zoom;
  Rect get sourceRect {
    final side = sourceSide;
    final maxX = (imageWidth - side) / 2;
    final maxY = (imageHeight - side) / 2;
    final cx = imageWidth / 2 + offsetX.clamp(-1.0, 1.0) * maxX;
    final cy = imageHeight / 2 + offsetY.clamp(-1.0, 1.0) * maxY;
    return Rect.fromCenter(center: Offset(cx, cy), width: side, height: side);
  }

  IconCrop moved(double dx, double dy, double viewportSide) {
    final perPixel = sourceSide / viewportSide;
    final maxX = math.max(0.0001, (imageWidth - sourceSide) / 2);
    final maxY = math.max(0.0001, (imageHeight - sourceSide) / 2);
    return IconCrop(imageWidth: imageWidth, imageHeight: imageHeight, zoom: zoom,
      offsetX: (offsetX - dx * perPixel / maxX).clamp(-1, 1),
      offsetY: (offsetY - dy * perPixel / maxY).clamp(-1, 1));
  }
  IconCrop zoomed(double value) => IconCrop(imageWidth: imageWidth,
    imageHeight: imageHeight, zoom: value.clamp(1, 4), offsetX: offsetX, offsetY: offsetY);

}

Future<Uint8List> renderIconCrop(ui.Image image, IconCrop crop) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  canvas.drawImageRect(image, crop.sourceRect, const Rect.fromLTWH(0, 0, 512, 512), ui.Paint());
  final picture = recorder.endRecording();
  final output = await picture.toImage(512, 512);
  try {
    final data = await output.toByteData(format: ui.ImageByteFormat.png);
    if (data == null) throw StateError('PNG encoding failed');
    return data.buffer.asUint8List();
  } finally { output.dispose(); picture.dispose(); }
}
