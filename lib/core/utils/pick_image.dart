import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageSelector {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> selectImagesFromGallery() async {
    List<XFile> selectedImages = [];
    try {
      final pickedFileList = await _picker.pickMultiImage();

      for (var pickedFile in pickedFileList) {
        final File file = File(pickedFile.path);
        final Uint8List bytes = await file.readAsBytes();
        final int fileSizeInBytes = bytes.lengthInBytes;
        const double maxSize = 2 * 1024 * 1024; // 2MB

        if (fileSizeInBytes > maxSize) {
          // Resize image if size exceeds 2MB
          final img.Image? image = img.decodeImage(bytes);
          final img.Image resizedImage = img.copyResize(image!, width: 800);
          final List<int> resizedBytes = img.encodeJpg(resizedImage);

          // Save resized image to temporary file
          final File resizedFile = File('${file.path}_resized.jpg');
          await resizedFile.writeAsBytes(resizedBytes);

          selectedImages.add(XFile(resizedFile.path));
        } else {
          selectedImages.add(pickedFile);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error selecting images: $e');
      }
    }
    return selectedImages;
  }
}
