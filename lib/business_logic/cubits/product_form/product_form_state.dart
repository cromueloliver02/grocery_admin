part of 'product_form_cubit.dart';

class ProductFormState extends Equatable {
  final String selectedCategory;
  final MeasureUnit selectedMeasureUnit;
  final Uint8List? selectedImage;

  const ProductFormState({
    required this.selectedCategory,
    required this.selectedMeasureUnit,
    this.selectedImage,
  });

  factory ProductFormState.initial() {
    return const ProductFormState(
      selectedCategory: 'Fruits',
      selectedMeasureUnit: MeasureUnit.kg,
      selectedImage: null,
    );
  }

  @override
  List<Object?> get props => [
        selectedCategory,
        selectedMeasureUnit,
        selectedImage,
      ];

  @override
  String toString() =>
      'ProductFormState(selectedCategory: $selectedCategory, selectedMeasureUnit: $selectedMeasureUnit, selectedImage: $selectedImage)';

  ProductFormState copyWith({
    String? selectedCategory,
    MeasureUnit? selectedMeasureUnit,
    Uint8List? Function()? selectedImage,
  }) {
    return ProductFormState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedMeasureUnit: selectedMeasureUnit ?? this.selectedMeasureUnit,
      selectedImage:
          selectedImage != null ? selectedImage() : this.selectedImage,
    );
  }
}
