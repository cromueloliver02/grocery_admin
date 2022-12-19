import 'package:flutter/material.dart';

import '../pages.dart';
import './components/products_view.dart';

class ProductsPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/products';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const ProductsPage(),
    );
  }

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsView();
  }
}
