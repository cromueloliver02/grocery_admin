import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 220,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DottedBorder(
        dashPattern: const [6.7],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image_outlined,
                size: 50,
              ),
              const SizedBox(height: 10),
              Text(
                'Choose an image',
                style: textTheme.bodyText2!.copyWith(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
