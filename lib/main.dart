import 'package:flutter/material.dart';

import './utils/utils.dart';
import './grocery_app.dart';

void main() {
  runApp(GroceryApp(
    routerHandler: RouteHandler(),
    blocHandler: BlocHandler(),
    themeHandler: ThemeHandler(),
  ));
}
