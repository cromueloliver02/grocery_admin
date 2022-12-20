import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? _selectedCategory;

  void _onCategoryChanged(String? value) {
    setState(() => _selectedCategory = value);
  }

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
          value: _selectedCategory,
          hint: const Text('Product Category'),
          isExpanded: true,
          focusColor: Colors.white,
          onChanged: _onCategoryChanged,
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
