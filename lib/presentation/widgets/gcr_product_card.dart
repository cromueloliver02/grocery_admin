import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import '../../data/models/models.dart';
import './widgets.dart';
import '../../utils/utils.dart';

class GCRProductcard extends StatelessWidget {
  const GCRProductcard.feed({
    super.key,
    required this.product,
    this.type = ProductCardType.feed,
  });

  const GCRProductcard.order({
    super.key,
    required this.product,
    this.type = ProductCardType.order,
  });

  final Product product;
  final ProductCardType type;

  @override
  Widget build(BuildContext context) {
    if (type == ProductCardType.feed) {
      return _ProductFeedCard(product: product);
    }

    if (type == ProductCardType.order) {
      return _ProductOrderCard(product: product);
    }

    return const SizedBox.shrink();
  }
}

class _ProductFeedCard extends StatelessWidget {
  const _ProductFeedCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
                      imageUrl: product.imageUrl,
                      boxFit: BoxFit.contain,
                    ),
                  ),
                  GCRPopupMenuButtons(product: product),
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
                      children: [
                        if (product.salePrice == null)
                          Text(
                            '\$${product.price}',
                            style: textTheme.headline4,
                          ),
                        if (product.salePrice != null) ...[
                          Text(
                            '\$${product.salePrice}',
                            style: textTheme.headline4,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '\$${product.price}',
                            style: textTheme.headline6!.copyWith(
                              color: Colors.grey[600],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                        const Spacer(),
                        Text(
                          product.measureUnit == MeasureUnit.kg
                              ? '1 Kg.'
                              : '1 Pcs.',
                          style: textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.name,
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
  const _ProductOrderCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
                  '12x for \$${product.price}',
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
