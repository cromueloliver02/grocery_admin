import 'package:flutter/material.dart';

import '../pages/pages.dart';

class RouteHandler {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPage.id:
        return NavigationPage.route(settings);
    }

    return null;
  }
}
