import 'package:flutter/material.dart';

import './business_logic/cubits/cubits.dart';
import './presentation/pages/pages.dart';
import './utils/utils.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({
    super.key,
    required this.routerHandler,
    required this.blocHandler,
    required this.themeHandler,
  });

  final RouteHandler routerHandler;
  final BlocHandler blocHandler;
  final ThemeHandler themeHandler;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: blocHandler.repositoryProviders,
      child: MultiBlocProvider(
        providers: blocHandler.blocProviders,
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (ctx, state) => MaterialApp(
            title: 'Grocery Admin',
            themeMode: state.themeMode,
            theme: themeHandler.lightTheme,
            darkTheme: themeHandler.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: NavigationPage.id,
            onGenerateRoute: routerHandler.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
