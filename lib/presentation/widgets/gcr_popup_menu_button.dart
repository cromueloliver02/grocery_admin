import 'package:flutter/material.dart';

class GCRPopupMenuButtons extends StatelessWidget {
  const GCRPopupMenuButtons({Key? key}) : super(key: key);

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
