import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class GCRProductcard extends StatelessWidget {
  const GCRProductcard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      color: theme.cardColor,
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
                  const _MenuButton(),
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

class _MenuButton extends StatelessWidget {
  const _MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton(
      onSelected: (value) {},
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        PopupMenuItem(
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
