import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../business_logic/cubits/cubits.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  void _changePage(BuildContext ctx, {required int idx}) {
    ctx.read<NavigationCubit>().changePage(idx);
  }

  void _toggleTheme(BuildContext ctx) {
    ctx.read<ThemeCubit>().toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (ctx, state) => Column(
          children: [
            const SizedBox(height: 20),
            DrawerHeader(
              child: Image.asset(
                'assets/images/groceries.png',
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              selected: state.currentIdx == 0,
              leading: const Icon(
                Icons.home_filled,
                size: 30,
              ),
              title: const Text('Home'),
              onTap: () => _changePage(context, idx: 0),
            ),
            ListTile(
              selected: state.currentIdx == 1,
              leading: const Icon(
                Icons.store,
                size: 30,
              ),
              title: const Text('Products'),
              onTap: () => _changePage(context, idx: 1),
            ),
            ListTile(
              selected: state.currentIdx == 2,
              leading: const Icon(
                IconlyBold.bag_2,
                size: 30,
              ),
              title: const Text('Orders'),
              onTap: () => _changePage(context, idx: 2),
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (ctx, state) => ListTile(
                leading: Icon(
                  state.themeMode == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  size: 30,
                ),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  onChanged: (value) => _toggleTheme(context),
                  value: state.themeMode != ThemeMode.light,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
