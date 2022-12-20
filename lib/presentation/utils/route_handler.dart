import 'package:flutter/material.dart';

import '../pages/pages.dart';

class RouteHandler {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPage.id:
        return NavigationPage.route(settings);
      case DashboardPage.id:
        return DashboardPage.route(settings);
      case ProductsPage.id:
        return ProductsPage.route(settings);
      case OrdersPage.id:
        return OrdersPage.route(settings);
    }

    return null;
  }
}
