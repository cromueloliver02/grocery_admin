import 'package:flutter/material.dart';

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
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const GCRProductcard.feed(
                      price: 7.35,
                      salePrice: 6.86,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const GCRProductcard.feed(price: 9.56),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const GCRProductcard.feed(
                      price: 7.74,
                      salePrice: 7.87,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const GCRProductcard.feed(
                      price: 2.64,
                      salePrice: 2.46,
                    ),
                  ),
                ],
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
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: const GCRProductcard.order(price: 4.38),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: const GCRProductcard.order(price: 6.82),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: const GCRProductcard.order(price: 2.97),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: const GCRProductcard.order(price: 8.86),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
