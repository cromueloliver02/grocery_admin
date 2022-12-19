import 'package:flutter/material.dart';

import '../pages.dart';
import './components/orders_view.dart';

class OrdersPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/orders';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const OrdersPage(),
    );
  }

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrdersView();
  }
}
