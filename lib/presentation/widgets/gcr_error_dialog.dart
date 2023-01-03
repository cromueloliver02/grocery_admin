import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import './widgets.dart';

class GCRErrorDialog extends StatelessWidget {
  const GCRErrorDialog({
    super.key,
    required this.error,
  });

  final GCRError error;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Image.asset(
            'assets/images/warning-sign.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Text(
            error.code,
            style: textTheme.headline4,
          ),
        ],
      ),
      content: Column(
        children: [
          Text(
            error.plugin,
            style: textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            error.message,
            style: textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        GCRButton.text(
          labelText: 'Ok',
          foregroundColor: Colors.red,
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
