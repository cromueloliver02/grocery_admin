import 'package:flutter/services.dart';

abstract class BaseImagePickerRepository {
  Future<Uint8List?> pickImage();
}
