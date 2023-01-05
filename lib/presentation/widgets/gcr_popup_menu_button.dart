import 'package:flutter/material.dart';

import '../../business_logic/cubits/cubits.dart';
import '../../data/models/models.dart';
import '../pages/pages.dart';
import '../../utils/utils.dart';

class GCRPopupMenuButtons extends StatelessWidget {
  const GCRPopupMenuButtons({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  void _onSelected(
    BuildContext ctx, {
    required PopupMenuItemType popupMenuItemType,
  }) async {
    final ProductCubit productCubit = ctx.read<ProductCubit>();

    if (popupMenuItemType == PopupMenuItemType.edit) {
      Navigator.pushNamed(ctx, ProductFormPage.id, arguments: product);
    }

    if (popupMenuItemType == PopupMenuItemType.delete) {
      final bool? response = await showWarningDialog(
        ctx,
        title: 'Delete Product',
        message: 'Are you sure you want to delete this product?',
      );

      if (response != null && response) {
        productCubit.deleteProduct(id: product!.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<PopupMenuItemType>(
      onSelected: (value) => _onSelected(context, popupMenuItemType: value),
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: PopupMenuItemType.edit,
          child: Row(
            children: [
              const Icon(
                Icons.edit,
                color: Colors.teal,
              ),
              const SizedBox(width: 10),
              Text(
                'Edit',
                style: textTheme.bodyText2,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: PopupMenuItemType.delete,
          child: Row(
            children: [
              const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              const SizedBox(width: 10),
              Text(
                'Delete',
                style: textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
