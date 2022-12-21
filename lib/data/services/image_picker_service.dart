import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService({
    required this.imagePicker,
  });

  Future<XFile?> pickImage() async {
    final XFile? rawImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    return rawImage;
  }
}
