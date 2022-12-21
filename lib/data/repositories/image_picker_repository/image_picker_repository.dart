import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/services.dart';
import './base_image_picker_repository.dart';

class ImagePickerRepository extends BaseImagePickerRepository {
  final ImagePickerService imagePickerService;

  ImagePickerRepository({
    required this.imagePickerService,
  });

  @override
  Future<Uint8List?> pickImage() async {
    final XFile? rawImage = await imagePickerService.pickImage();
    final Uint8List? image =
        rawImage != null ? await rawImage.readAsBytes() : null;

    return image;
  }
}
