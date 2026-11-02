import 'package:flutter_test/flutter_test.dart';
import 'package:moodiary_mobile/app/settings/presentation/personalization/icon_crop.dart';

void main() {
  test('center crop is square and inside landscape image', () {
    const crop = IconCrop(imageWidth: 1600, imageHeight: 900);
    final rect = crop.sourceRect;
    expect(rect.width, 900); expect(rect.height, 900);
    expect(rect.left, 350); expect(rect.top, 0);
  });
  test('zoom and pan stay bounded', () {
    const crop = IconCrop(imageWidth: 1000, imageHeight: 1000);
    final zoomed = crop.zoomed(2).moved(-10000, 10000, 280);
    expect(zoomed.sourceSide, 500);
    final rect = zoomed.sourceRect;
    expect(rect.left, greaterThanOrEqualTo(0)); expect(rect.right, lessThanOrEqualTo(1000));
    expect(rect.top, greaterThanOrEqualTo(0)); expect(rect.bottom, lessThanOrEqualTo(1000));
    expect(crop.zoomed(99).zoom, 4);
  });
}
