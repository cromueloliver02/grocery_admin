import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:recase/recase.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class GCROrderCard extends StatelessWidget {
  const GCROrderCard({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final CartItem cartItem = orderItem.cartItems.first;
    final Product product = cartItem.product;

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
                imageUrl: product.imageUrl,
                boxFit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cartItem.quantity}x for \$${product.isOnSale ? product.salePrice : product.price}',
                  style: textTheme.headline6,
                ),
                const SizedBox(height: 5),
                Text(
                  'By: ${orderItem.user.name.titleCase}',
                  style: textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  formatDateTime(orderItem.createdAt),
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
