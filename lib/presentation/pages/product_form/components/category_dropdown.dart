import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final String? selectedCategory;
  final void Function(String?) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Fruits',
      'Vegetables',
      'Herbs',
      'Nuts',
      'Spices',
      'Grains',
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          hint: const Text('Product Category'),
          isExpanded: true,
          focusColor: Colors.white,
          onChanged: onCategoryChanged,
          items: categories
              .map((d) => DropdownMenuItem<String>(
                    value: d,
                    child: Text(d),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
