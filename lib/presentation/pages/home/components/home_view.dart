import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                itemBuilder: (ctx, idx) => const GCRProductcard.feed(),
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
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
                GCRProductcard.order(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
