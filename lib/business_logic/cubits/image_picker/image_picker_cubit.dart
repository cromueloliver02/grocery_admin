import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/repositories.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerRepository imagePickerRepository;

  ImagePickerCubit({
    required this.imagePickerRepository,
  }) : super(ImagePickerState.initial());

  void pickImage() async {
    final Uint8List? image = await imagePickerRepository.pickImage();

    emit(state.copyWith(selectedImage: image));
  }
}
