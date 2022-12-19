import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../pages/pages.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  final _pages = const [
    HomePage(),
    ProductsPage(),
    OrdersPage(),
  ];

  void _changePage(BuildContext ctx, {required int idx}) {
    ctx.read<NavigationCubit>().changePage(idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            child: Column(
              children: [
                const SizedBox(height: 20),
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/groceries.png',
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () => _changePage(context, idx: 0),
                  leading: const Icon(
                    Icons.home_filled,
                    size: 30,
                  ),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () => _changePage(context, idx: 1),
                  leading: const Icon(
                    Icons.store,
                    size: 30,
                  ),
                  title: const Text('Products'),
                ),
                ListTile(
                  onTap: () => _changePage(context, idx: 2),
                  leading: const Icon(
                    IconlyBold.bag_2,
                    size: 30,
                  ),
                  title: const Text('Orders'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.light_mode,
                    size: 30,
                  ),
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    onChanged: (value) {},
                    value: false,
                  ),
                ),
              ],
            ),
          ),
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
