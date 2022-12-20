import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          const GCRPageHeader(title: 'ORDERS'),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'All Orders',
                style: textTheme.headline5,
              ),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.delete_sweep),
                label: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              padding: const EdgeInsets.only(bottom: 20),
              separatorBuilder: (ctx, idx) => const SizedBox(height: 6),
              itemBuilder: (ctx, idx) => const GCRProductcard.order(
                price: 8.36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
