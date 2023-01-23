import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

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
            child: BlocBuilder<OrderListBloc, OrderListState>(
              builder: (ctx, state) {
                final OrderListStatus status = state.status;

                if (status == OrderListStatus.initial) {
                  return const SizedBox.shrink();
                }

                if (status == OrderListStatus.loading) {
                  return const GCRLoadingCard();
                }

                if (status == OrderListStatus.failure) {
                  return const GCRErrorCard();
                }

                if (state.order.orderItems.isEmpty) {
                  return const GCRMessageCard();
                }

                return ListView.separated(
                  itemCount: state.order.orderItems.length,
                  padding: const EdgeInsets.only(bottom: 20),
                  separatorBuilder: (ctx, idx) => const SizedBox(height: 6),
                  itemBuilder: (ctx, idx) => GCROrderCard(
                    orderItem: state.order.orderItems[idx],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
