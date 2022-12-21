import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/repositories.dart';
import '../../../presentation/utils/utils.dart';

part 'product_form_state.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  final ImagePickerRepository imagePickerRepository;

  ProductFormCubit({
    required this.imagePickerRepository,
  }) : super(ProductFormState.initial());

  void changeCategory(String? value) {
    emit(state.copyWith(selectedCategory: () => value));
  }

  void changeMeasureUnit(MeasureUnit? value) {
    emit(state.copyWith(selectedMeasureUnit: value));
  }

  void pickImage() async {
    final Uint8List? image = await imagePickerRepository.pickImage();

    emit(state.copyWith(selectedImage: () => image));
  }

  void clearImage() => emit(state.copyWith(selectedImage: () => null));
}
