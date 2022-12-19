import 'package:flutter/material.dart';

import './widgets.dart';

class GCRPageHeader extends StatelessWidget {
  const GCRPageHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.headline4,
        ),
        const GCRSearchTextField(),
      ],
    );
  }
}
