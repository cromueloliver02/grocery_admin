import 'package:flutter/material.dart';

import '../presentation/pages/pages.dart';

class RouteHandler {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPage.id:
        return NavigationPage.route(settings);
      case ProductFormPage.id:
        return ProductFormPage.route(settings);
    }

    return null;
  }
}
