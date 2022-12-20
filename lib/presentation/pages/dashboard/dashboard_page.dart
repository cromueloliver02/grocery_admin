import 'package:flutter/material.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import './components/dashboard_view.dart';

class DashboardPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/dashboard';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<NavigationCubit>.value(
        value: ctx.read<NavigationCubit>(),
        child: const DashboardPage(),
      ),
    );
  }

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
