import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

import '../../../../business_logic/cubits/cubits.dart';

class SalePriceField extends StatefulWidget {
  const SalePriceField({
    super.key,
    required this.controller,
    required this.originalPrice,
    required this.currentSalePrice,
  });

  final TextEditingController controller;
  final double? originalPrice;
  final double? currentSalePrice;

  @override
  State<SalePriceField> createState() => _SalePriceFieldState();
}

class _SalePriceFieldState extends State<SalePriceField> {
  void _onSalePriceChanged(BuildContext ctx, {required double? value}) {
    ctx.read<ProductFormCubit>().changeSalePrice(value);
  }

  String? _salePriceValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Sale Price is required.';
    }

    if (!isNumeric(value.trim())) {
      return 'Please enter a valid sale price';
    }

    if (widget.originalPrice != null &&
        widget.originalPrice! <= double.parse(value)) {
      return 'Please enter a lower price than original price';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ProductFormCubit, ProductFormState>(
      builder: (ctx, state) => Column(
        children: [
          Row(
            children: [
              BlocListener<ProductFormCubit, ProductFormState>(
                listener: (ctx, state) {
                  if (!state.onSale) _onSalePriceChanged(ctx, value: null);
                },
                child: Checkbox(
                  value: state.onSale,
                  onChanged: (value) {
                    ctx.read<ProductFormCubit>().toggleOnSale();
                  },
                ),
              ),
              Text(
                'On sale?',
                style: textTheme.headline6,
              ),
            ],
          ),
          if (state.onSale)
            TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: const InputDecoration(
                labelText: 'Sale Price in \$',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              validator: _salePriceValidator,
              onChanged: (value) {
                _onSalePriceChanged(context, value: double.parse(value));
              },
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    context
        .read<ProductFormCubit>()
        .toggleOnSale(widget.currentSalePrice != null);
  }
}
