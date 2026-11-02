import 'package:cross_file/cross_file.dart';
import 'package:flutter/widgets.dart';

abstract class IFilePicker {
  Future<List<XFile>> pickImages(BuildContext context, {int maxAssets = 9});

  Future<XFile?> pickVideo(BuildContext context);

  Future<XFile?> takePhoto();

  Future<XFile?> pickAudio();

  /// Document picker for the music theme. Empty list means user cancellation.
  Future<List<XFile>> pickAudioFiles();

  Future<XFile?> pickFile({List<String>? allowedExtensions});
}
