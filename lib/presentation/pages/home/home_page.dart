import 'package:flutter/material.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import './components/home_view.dart';

class HomePage extends StatelessWidget {
  static const id = '${NavigationPage.id}/home';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<NavigationCubit>.value(
        value: ctx.read<NavigationCubit>(),
        child: const HomePage(),
      ),
    );
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
