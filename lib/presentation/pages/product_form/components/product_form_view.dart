import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../business_logic/cubits/cubits.dart';
import './category_dropdown.dart';
import './measure_unit_selector.dart';
import './image_picker.dart';
import './image_viewer.dart';
import './action_buttons.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create/Edit Product',
          style: textTheme.headline5,
        ),
      ),
      body: Center(
        child: Container(
          color: theme.cardColor,
          width: 800,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Product Form',
                  style: textTheme.headline4,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Price in \$',
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CategoryDropdown(),
                        const SizedBox(height: 15),
                        const MeasureUnitSelector(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
                      builder: (ctx, state) {
                        if (state.selectedImage != null) {
                          return ImageViewer(image: state.selectedImage!);
                        }

                        return const ImagePicker();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
