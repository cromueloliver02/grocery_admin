import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import './search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
          SizedBox(
            height: 285,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (ctx, idx) => const SizedBox(width: 20),
              itemBuilder: (ctx, idx) => const GCRProductcard(),
            ),
          ),
        ],
      ),
    );
  }
}
