import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  String? _priceValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required.';
    }

    if (!isNumeric(value.trim())) {
      return 'Please enter a valid price';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: const InputDecoration(
        labelText: 'Price in \$',
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
      validator: _priceValidator,
    );
  }
}
