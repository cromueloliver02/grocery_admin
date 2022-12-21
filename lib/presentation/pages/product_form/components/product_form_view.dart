import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './category_dropdown.dart';
import './gender_selector.dart';
import './image_picker.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: theme.cardColor,
          width: 600,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  const Expanded(
                    flex: 2,
                    child: ImagePicker(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Clear Form'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Upload'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
