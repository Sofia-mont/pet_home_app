import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> selectImagesFromGallery() async {
    List<XFile> selectedImages = [];
    try {
      final pickedFileList = await _picker.pickMultiImage();

      for (var pickedFile in pickedFileList) {
        selectedImages.add(pickedFile);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error selecting images: $e');
      }
    }
    return selectedImages;
  }
}
