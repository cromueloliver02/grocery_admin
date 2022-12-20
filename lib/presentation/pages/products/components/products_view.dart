import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  void _goToProductFormPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProductFormPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          const GCRPageHeader(title: 'PRODUCTS'),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'All Products',
                style: textTheme.headline5,
              ),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () => _goToProductFormPage(context),
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 425 / 450,
              ),
              itemBuilder: (ctx, idx) => const GCRProductcard.feed(price: 5.39),
            ),
          ),
        ],
      ),
    );
  }
}
