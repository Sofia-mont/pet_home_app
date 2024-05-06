import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();

  Future<List<MultipartFile>> selectImagesFromGallery() async {
    List<MultipartFile> selectedImages = [];
    try {
      final pickedFileList = await _picker.pickMultiImage();

      for (var pickedFile in pickedFileList) {
        selectedImages.add(
          MultipartFile.fromBytes(
            await pickedFile.readAsBytes(),
            filename: pickedFile.name,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error selecting images: $e');
      }
    }
    return selectedImages;
  }
}
