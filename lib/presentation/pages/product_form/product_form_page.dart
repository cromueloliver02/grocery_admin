import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return const ProductFormView();
  }
}
