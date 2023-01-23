import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  void _changePage(BuildContext ctx, {required int idx}) {
    ctx.read<NavigationCubit>().changePage(idx);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GCRPageHeader(title: 'DASHBOARD'),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Latest Products',
                  style: textTheme.headline5,
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _changePage(context, idx: 1),
                  icon: const Icon(Icons.store),
                  label: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 285,
              child: BlocBuilder<ProductListBloc, ProductListState>(
                builder: (ctx, state) {
                  if (state.productList.isEmpty) {
                    return const GCRMessageCard();
                  }

                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      state.productList.length < 4
                          ? state.productList.length
                          : 4,
                      (idx) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: GCRProductFeedCard(
                          product: state.productList[idx],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Text(
                  'Latest Orders',
                  style: textTheme.headline5,
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _changePage(context, idx: 2),
                  icon: const Icon(Icons.store),
                  label: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<OrderListBloc, OrderListState>(
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

                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    state.order.orderItems.length < 4
                        ? state.order.orderItems.length
                        : 4,
                    (idx) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      child: GCROrderCard(
                        orderItem: state.order.orderItems[idx],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
