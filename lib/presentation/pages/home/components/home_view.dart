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
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DASHBOARD',
                style: textTheme.headline4,
              ),
              const SearchBar(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Latest Products',
                style: textTheme.headline5,
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.store),
                label: const Text('View All'),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
