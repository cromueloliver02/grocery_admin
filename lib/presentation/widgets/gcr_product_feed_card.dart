import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import '../../data/models/models.dart';
import './widgets.dart';
import '../../utils/utils.dart';

class GCRProductFeedCard extends StatelessWidget {
  const GCRProductFeedCard({
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
                            style: textTheme.headline3,
                          ),
                        if (product.salePrice != null) ...[
                          Text(
                            '\$${product.salePrice}',
                            style: textTheme.headline3,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '\$${product.price}',
                            style: textTheme.headline5!.copyWith(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w500,
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
