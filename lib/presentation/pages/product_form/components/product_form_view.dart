import 'package:flutter/material.dart';

import './product_form.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create/Edit Product',
          style: textTheme.headline5,
        ),
      ),
      body: Center(
        child: Container(
          color: theme.cardColor,
          width: 800,
          padding: const EdgeInsets.all(20),
          child: const ProductForm(),
        ),
      ),
    );
  }
}
