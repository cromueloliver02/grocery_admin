import 'package:flutter/material.dart';

import './pages/pages.dart';
import './utils/utils.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({
    super.key,
    required this.routerHandler,
  });

  final RouteHandler routerHandler;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Admin',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationPage.id,
      onGenerateRoute: routerHandler.onGenerateRoute,
    );
  }
}
