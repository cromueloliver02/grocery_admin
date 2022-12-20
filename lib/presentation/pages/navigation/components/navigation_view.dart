import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../pages/pages.dart';
import './side_bar_menu.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  final _pages = const [
    DashboardPage(),
    ProductsPage(),
    OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideBarMenu(),
          Expanded(
            child: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (ctx, state) => IndexedStack(
                index: state.currentIdx,
                children: _pages,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
