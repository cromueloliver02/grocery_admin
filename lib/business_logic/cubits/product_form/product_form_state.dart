part of 'product_form_cubit.dart';

class ProductFormState extends Equatable {
  final bool onSale;
  final String selectedCategory;
  final MeasureUnit selectedMeasureUnit;
  final Uint8List? selectedImage;

  const ProductFormState({
    required this.onSale,
    required this.selectedCategory,
    required this.selectedMeasureUnit,
    this.selectedImage,
  });

  factory ProductFormState.initial() {
    return const ProductFormState(
      onSale: false,
      selectedCategory: 'Fruits',
      selectedMeasureUnit: MeasureUnit.kg,
      selectedImage: null,
    );
  }

  @override
  List<Object?> get props => [
        onSale,
        selectedCategory,
        selectedMeasureUnit,
        selectedImage,
      ];

  @override
  String toString() {
    return 'ProductFormState(onSale: $onSale, selectedCategory: $selectedCategory, selectedMeasureUnit: $selectedMeasureUnit, selectedImage: $selectedImage)';
  }

  ProductFormState copyWith({
    bool? onSale,
    String? selectedCategory,
    MeasureUnit? selectedMeasureUnit,
    Uint8List? Function()? selectedImage,
  }) {
    return ProductFormState(
      onSale: onSale ?? this.onSale,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedMeasureUnit: selectedMeasureUnit ?? this.selectedMeasureUnit,
      selectedImage:
          selectedImage != null ? selectedImage() : this.selectedImage,
    );
  }
}
