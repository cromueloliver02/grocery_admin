import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './category_dropdown.dart';
import './measure_unit_selector.dart';
import './image_picker.dart';
import './image_viewer.dart';
import './bottom_action_buttons.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  String? _selectedCategory;
  MeasureUnit _selectedMeasureUnit = MeasureUnit.kg;

  void _onClearForm(BuildContext ctx) {
    _nameController.clear();
    _priceController.clear();
    ctx.read<ImagePickerCubit>().clearImage();
    setState(() {
      _selectedCategory = null;
      _selectedMeasureUnit = MeasureUnit.kg;
    });
  }

  void _onCategoryChanged(String? value) {
    setState(() => _selectedCategory = value);
  }

  void _onMeasureUnitChanged(MeasureUnit? value) {
    setState(() => _selectedMeasureUnit = value!);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
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
          controller: _nameController,
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
                    controller: _priceController,
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
                  CategoryDropdown(
                    selectedCategory: _selectedCategory,
                    onCategoryChanged: _onCategoryChanged,
                  ),
                  const SizedBox(height: 15),
                  MeasureUnitSelector(
                    selectedMeasureUnit: _selectedMeasureUnit,
                    onMeasureUnitChanged: _onMeasureUnitChanged,
                  ),
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
        BottomActionButtons(onClearForm: _onClearForm),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
