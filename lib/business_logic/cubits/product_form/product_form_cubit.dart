import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'product_form_state.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  final ImagePickerRepository imagePickerRepository;

  ProductFormCubit({
    required this.imagePickerRepository,
  }) : super(ProductFormState.initial());

  void toggleOnSale([bool? onSale]) {
    emit(state.copyWith(onSale: onSale ?? !state.onSale));
  }

  void changeCategory(String? value) {
    emit(state.copyWith(selectedCategory: value));
  }

  void changeMeasureUnit(MeasureUnit? value) {
    emit(state.copyWith(selectedMeasureUnit: value));
  }

  void pickImage() async {
    final Uint8List? image = await imagePickerRepository.pickImage();

    emit(state.copyWith(selectedImage: () => image));
  }

  void setImage(String imageUrl) async {
    try {
      final Uint8List image = await urlToBytes(imageUrl);

      emit(state.copyWith(selectedImage: () => image));
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void clearImage() => emit(state.copyWith(selectedImage: () => null));

  void clearAll() => emit(ProductFormState.initial());
}
