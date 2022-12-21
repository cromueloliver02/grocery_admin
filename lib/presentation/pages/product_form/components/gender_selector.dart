import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  MeasureUnit _selectedGender = MeasureUnit.kg;

  void _genderOnChanged(MeasureUnit? value) {
    setState(() => _selectedGender = value!);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Measure Unit',
            style: textTheme.bodyText1,
          ),
        ),
        RadioListTile<MeasureUnit>(
          title: Text(
            'KG',
            style: textTheme.bodyText2,
          ),
          dense: true,
          value: MeasureUnit.kg,
          groupValue: _selectedGender,
          onChanged: _genderOnChanged,
        ),
        RadioListTile<MeasureUnit>(
          title: Text(
            'Piece',
            style: textTheme.bodyText2,
          ),
          dense: true,
          value: MeasureUnit.piece,
          groupValue: _selectedGender,
          onChanged: _genderOnChanged,
        ),
      ],
    );
  }
}
