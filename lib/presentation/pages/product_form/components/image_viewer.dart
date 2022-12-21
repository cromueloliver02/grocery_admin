import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../business_logic/cubits/cubits.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.image,
  });

  final Uint8List image;

  void _pickImage(BuildContext ctx) {
    ctx.read<ProductFormCubit>().pickImage();
  }

  void _clearImage(BuildContext ctx) {
    ctx.read<ProductFormCubit>().clearImage();
  }

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
        BlocBuilder<ProductFormCubit, ProductFormState>(
          builder: (ctx, state) {
            if (state.selectedImage == null) return const SizedBox.shrink();

            return Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => _clearImage(context),
                      child: Text(
                        'Clear Image',
                        style: textTheme.bodyText2!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () => _pickImage(context),
                      child: Text(
                        'Change Image',
                        style: textTheme.bodyText2!.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
