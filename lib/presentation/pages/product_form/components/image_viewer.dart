import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../business_logic/cubits/cubits.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.image,
  });

  final Uint8List image;

  void _pickImage(BuildContext ctx) => ctx.read<ImagePickerCubit>().pickImage();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 300,
          child: Image.memory(
            image,
            fit: BoxFit.cover,
          ),
        ),
        BlocBuilder<ImagePickerCubit, ImagePickerState>(
          builder: (ctx, state) {
            if (state.selectedImage == null) return const SizedBox.shrink();

            return Column(
              children: [
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () => _pickImage(context),
                  child: Text(
                    'Change image',
                    style: textTheme.bodyText2!.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
