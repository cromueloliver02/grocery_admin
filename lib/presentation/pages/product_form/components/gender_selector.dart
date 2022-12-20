import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  Gender _selectedGender = Gender.male;

  void _genderOnChanged(Gender? value) {
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
        RadioListTile<Gender>(
          title: Text(
            'Male',
            style: textTheme.bodyText2,
          ),
          dense: true,
          value: Gender.male,
          groupValue: _selectedGender,
          onChanged: _genderOnChanged,
        ),
        RadioListTile<Gender>(
          title: Text(
            'Female',
            style: textTheme.bodyText2,
          ),
          dense: true,
          value: Gender.female,
          groupValue: _selectedGender,
          onChanged: _genderOnChanged,
        ),
      ],
    );
  }
}
