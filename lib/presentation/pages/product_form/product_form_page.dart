import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_form_view.dart';

class ProductFormPage extends StatelessWidget {
  static const id = '/product-form';

  static Route<void> route(RouteSettings settings) {
    final Product? product = settings.arguments as Product?;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => ProductFormPage(product: product),
    );
  }

  const ProductFormPage({
    super.key,
    required this.product,
  });

  final Product? product;

  void _productListener(BuildContext ctx, ProductState state) {
    if (state.status == ProductFormStatus.success) {
      showMessageToast('Product saved successfully');
    }

    if (state.status == ProductFormStatus.failure) {
      showErrorDialog(ctx, error: state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ImagePickerRepository>(
      create: (ctx) => ImagePickerRepository(
        imagePickerService: ImagePickerService(
          imagePicker: ImagePicker(),
        ),
      ),
      child: BlocProvider<ProductFormCubit>(
        create: (ctx) => ProductFormCubit(
          imagePickerRepository: ctx.read<ImagePickerRepository>(),
        ),
        child: BlocListener<ProductCubit, ProductState>(
          listener: _productListener,
          child: ProductFormView(product: product),
        ),
      ),
    );
  }
}
