import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../../utils/utils.dart';
import './price_field.dart';
import './sale_price_field.dart';
import './category_dropdown.dart';
import './measure_unit_selector.dart';
import './image_picker.dart';
import './image_viewer.dart';
import './bottom_action_buttons.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _salePriceController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext ctx) async {
    final FormState? form = _formKey.currentState;
    final ProductFormState productFormState =
        ctx.read<ProductFormCubit>().state;

    final Uint8List? selectedImage = productFormState.selectedImage;

    if (selectedImage == null) {
      showMessageToast('Please select an image');
    }

    if (!(form != null && form.validate() && selectedImage != null)) return;

    if (widget.product == null) {
      ctx.read<ProductCubit>().createProduct(
            name: _nameController.text,
            image: productFormState.selectedImage!,
            category: productFormState.selectedCategory,
            price: productFormState.price,
            salePrice: productFormState.salePrice,
            measureUnit: productFormState.selectedMeasureUnit,
          );
    } else {
      final ProductCubit productCubit = ctx.read<ProductCubit>();
      final Product product = widget.product!;
      final Uint8List image = await urlToBytes(product.imageUrl);

      if (product.name == _nameController.text &&
          listEquals(image, productFormState.selectedImage!) &&
          product.category == productFormState.selectedCategory &&
          product.price == productFormState.price &&
          (_salePriceController.text.isEmpty
              ? true
              : product.salePrice == double.parse(_salePriceController.text)) &&
          product.salePrice == productFormState.salePrice &&
          product.measureUnit == productFormState.selectedMeasureUnit) {
        showMessageToast('You didn\'t change any field');
        return;
      }

      productCubit.updateProduct(
        id: product.id,
        name:
            product.name == _nameController.text ? null : _nameController.text,
        oldImageUrl: product.imageUrl,
        newImage: listEquals(image, productFormState.selectedImage!)
            ? null
            : productFormState.selectedImage!,
        category: product.category == productFormState.selectedCategory
            ? null
            : productFormState.selectedCategory,
        price: product.price == productFormState.price
            ? null
            : double.parse(_priceController.text),
        salePrice: product.salePrice == productFormState.salePrice
            ? null
            : productFormState.salePrice,
        measureUnit: product.measureUnit == productFormState.selectedMeasureUnit
            ? null
            : productFormState.selectedMeasureUnit,
      );
    }
  }

  void _clearForm(BuildContext ctx) {
    _nameController.clear();
    _priceController.clear();
    _salePriceController.clear();
    ctx.read<ProductFormCubit>().clearAll();
  }

  void _onPriceChanged(double value) {
    context.read<ProductFormCubit>().changePrice(value);
  }

  void _onSalePriceChanged(double? value) {
    context.read<ProductFormCubit>().changeSalePrice(value);
  }

  void _onCategoryChanged(String? value) {
    context.read<ProductFormCubit>().changeCategory(value);
  }

  void _onMeasureUnitChanged(MeasureUnit? value) {
    context.read<ProductFormCubit>().changeMeasureUnit(value);
  }

  String? _nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }

    if (value.trim().length < 6) {
      return 'Please enter a valid name';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Form(
      key: _formKey,
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
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
            validator: _nameValidator,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocConsumer<ProductFormCubit, ProductFormState>(
                  listener: (ctx, state) {
                    if (!state.onSale) _salePriceController.clear();
                  },
                  builder: (ctx, state) => Column(
                    children: [
                      PriceField(
                        controller: _priceController,
                        currentSalePrice: widget.product == null
                            ? state.salePrice
                            : widget.product!.salePrice,
                      ),
                      const SizedBox(height: 10),
                      SalePriceField(
                        controller: _salePriceController,
                        originalPrice: widget.product == null
                            ? state.price
                            : widget.product!.price,
                        currentSalePrice: widget.product?.salePrice,
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<ProductFormCubit, ProductFormState>(
                        builder: (ctx, state) => Column(
                          children: [
                            CategoryDropdown(
                              selectedCategory: state.selectedCategory,
                              onCategoryChanged: _onCategoryChanged,
                            ),
                            const SizedBox(height: 15),
                            MeasureUnitSelector(
                              selectedMeasureUnit: state.selectedMeasureUnit,
                              onMeasureUnitChanged: _onMeasureUnitChanged,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: BlocBuilder<ProductFormCubit, ProductFormState>(
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
          BlocListener<ProductCubit, ProductState>(
            listener: (ctx, state) {
              if (state.status == ProductFormStatus.success) {
                Navigator.pop(context);
              }
            },
            child: BottomActionButtons(
              isCreate: widget.product == null,
              onSubmit: () => _onSubmit(context),
              onClearForm: _clearForm,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final Product? product = widget.product;

    _nameController = TextEditingController(text: product?.name);
    _priceController = TextEditingController(text: product?.price.toString());
    _salePriceController = TextEditingController(
      text: product?.salePrice != null ? product?.salePrice.toString() : '',
    );

    if (product != null) {
      _onPriceChanged(product.price);
      _onSalePriceChanged(product.salePrice);
      _onCategoryChanged(product.category);
      _onMeasureUnitChanged(product.measureUnit);
      context.read<ProductFormCubit>().setImage(product.imageUrl);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _salePriceController.dispose();
    super.dispose();
  }
}
