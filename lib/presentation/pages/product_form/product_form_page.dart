import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/services/services.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/product_form_view.dart';

class ProductFormPage extends StatelessWidget {
  static const id = '/product-form';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => RepositoryProvider<ImagePickerRepository>(
        create: (ctx) => ImagePickerRepository(
          imagePickerService: ImagePickerService(
            imagePicker: ImagePicker(),
          ),
        ),
        child: BlocProvider<ProductFormCubit>(
          create: (ctx) => ProductFormCubit(
            imagePickerRepository: ctx.read<ImagePickerRepository>(),
          ),
          child: const ProductFormPage(),
        ),
      ),
    );
  }

  const ProductFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductFormView();
  }
}
