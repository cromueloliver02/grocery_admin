import 'package:flutter/material.dart';

import './presentation/utils/utils.dart';
import './presentation/grocery_app.dart';

void main() {
  runApp(GroceryApp(
    routerHandler: RouteHandler(),
  ));
}
