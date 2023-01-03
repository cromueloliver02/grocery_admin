import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/services/services.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_form_view.dart';

class ProductFormPage extends StatelessWidget {
  static const id = '/product-form';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const ProductFormPage(),
    );
  }

  const ProductFormPage({super.key});

  void _productListener(BuildContext ctx, ProductState state) {
    if (state.status == ProductStatus.success) {
      showMessageToast('Product successfully created');
    }

    if (state.status == ProductStatus.failure) {
      showErrorDialog(ctx, error: state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (ctx) => ProductRepository(
            productService: ProductService(
              firestore: FirebaseFirestore.instance,
              storage: FirebaseStorage.instance,
            ),
          ),
        ),
        RepositoryProvider<ImagePickerRepository>(
          create: (ctx) => ImagePickerRepository(
            imagePickerService: ImagePickerService(
              imagePicker: ImagePicker(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (ctx) => ProductCubit(
              productRespository: ctx.read<ProductRepository>(),
            ),
          ),
          BlocProvider<ProductFormCubit>(
            create: (ctx) => ProductFormCubit(
              imagePickerRepository: ctx.read<ImagePickerRepository>(),
            ),
          ),
        ],
        child: BlocListener<ProductCubit, ProductState>(
          listener: _productListener,
          child: const ProductFormView(),
        ),
      ),
    );
  }
}
