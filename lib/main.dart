import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './utils/utils.dart';
import './firebase_options.dart';
import './grocery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GroceryApp(
    routerHandler: RouteHandler(),
    blocHandler: BlocHandler(),
    themeHandler: ThemeHandler(),
  ));
}
