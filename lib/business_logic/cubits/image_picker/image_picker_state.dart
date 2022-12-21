part of 'image_picker_cubit.dart';

class ImagePickerState extends Equatable {
  final Uint8List? selectedImage;

  const ImagePickerState({
    this.selectedImage,
  });

  factory ImagePickerState.initial() {
    return const ImagePickerState();
  }

  @override
  List<Object?> get props => [selectedImage];

  @override
  String toString() => 'ImagePickerState(selectedImage: $selectedImage)';

  ImagePickerState copyWith({
    Uint8List? Function()? selectedImage,
  }) {
    return ImagePickerState(
      selectedImage:
          selectedImage != null ? selectedImage() : this.selectedImage,
    );
  }
}
