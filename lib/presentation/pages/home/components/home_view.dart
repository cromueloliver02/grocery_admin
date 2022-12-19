import 'package:flutter/material.dart';

import './search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DASHBOARD',
                style: textTheme.headline4,
              ),
              const SearchBar(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}
