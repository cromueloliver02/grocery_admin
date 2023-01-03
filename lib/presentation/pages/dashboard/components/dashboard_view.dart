import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';

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
                builder: (ctx, state) => ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    state.productList.length < 4 ? state.productList.length : 4,
                    (idx) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: GCRProductcard.feed(
                        product: state.productList[idx],
                      ),
                    ),
                  ),
                ),
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
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 3),
                //   child: const GCRProductcard.order(price: 4.38),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 3),
                //   child: const GCRProductcard.order(price: 6.82),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 3),
                //   child: const GCRProductcard.order(price: 2.97),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 3),
                //   child: const GCRProductcard.order(price: 8.86),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
