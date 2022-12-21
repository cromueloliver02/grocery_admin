import 'package:flutter/material.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Clear Form'),
        ),
        const SizedBox(width: 50),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Upload'),
        ),
      ],
    );
  }
}
