import 'package:flutter/material.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({
    super.key,
    required this.onSubmit,
    required this.onClearForm,
  });

  final VoidCallback onSubmit;
  final void Function(BuildContext) onClearForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onClearForm(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Clear Form'),
        ),
        const SizedBox(width: 50),
        ElevatedButton(
          onPressed: onSubmit,
          child: const Text('Upload'),
        ),
      ],
    );
  }
}
