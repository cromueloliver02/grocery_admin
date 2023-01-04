import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './product_form.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${product == null ? 'Create' : 'Update'}  Product',
          style: textTheme.headline5,
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (ctx, state) => GCRLoadingOverlay(
          loading: state.status == ProductFormStatus.loading,
          child: Center(
            child: Container(
              color: theme.cardColor,
              width: 900,
              padding: const EdgeInsets.all(20),
              child: ProductForm(product: product),
            ),
          ),
        ),
      ),
    );
  }
}
