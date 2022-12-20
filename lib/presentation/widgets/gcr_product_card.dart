import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import './widgets.dart';
import '../utils/utils.dart';

class GCRProductcard extends StatelessWidget {
  const GCRProductcard.feed({
    super.key,
    this.type = ProductCardType.feed,
  });

  const GCRProductcard.order({
    super.key,
    this.type = ProductCardType.order,
  });

  final ProductCardType type;

  @override
  Widget build(BuildContext context) {
    if (type == ProductCardType.feed) {
      return const _ProductFeedCard();
    }

    if (type == ProductCardType.order) {
      return const _ProductOrderCard();
    }

    return const SizedBox.shrink();
  }
}

class _ProductFeedCard extends StatelessWidget {
  const _ProductFeedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      color: theme.canvasColor,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 210,
                    height: 210,
                    child: FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      boxFit: BoxFit.contain,
                    ),
                  ),
                  const GCRPopupMenuButtons(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$4.83',
                          style: textTheme.headline5,
                        ),
                        Text(
                          '1KG',
                          style: textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Product Name',
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductOrderCard extends StatelessWidget {
  const _ProductOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      color: theme.cardColor,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const SizedBox(width: 20),
            SizedBox(
              width: 125,
              height: 125,
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                boxFit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12x for \$32.23',
                  style: textTheme.headline6,
                ),
                const SizedBox(height: 5),
                Text(
                  'By: Cromuel Barut',
                  style: textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  formatDateTime(DateTime.now()),
                  style: textTheme.bodyText2!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
