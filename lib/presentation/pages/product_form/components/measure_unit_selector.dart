import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class MeasureUnitSelector extends StatelessWidget {
  const MeasureUnitSelector({
    super.key,
    required this.selectedMeasureUnit,
    required this.onMeasureUnitChanged,
  });

  final MeasureUnit selectedMeasureUnit;
  final void Function(MeasureUnit?) onMeasureUnitChanged;

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
          groupValue: selectedMeasureUnit,
          onChanged: onMeasureUnitChanged,
        ),
        RadioListTile<MeasureUnit>(
          title: Text(
            'Piece',
            style: textTheme.bodyText2,
          ),
          dense: true,
          value: MeasureUnit.piece,
          groupValue: selectedMeasureUnit,
          onChanged: onMeasureUnitChanged,
        ),
      ],
    );
  }
}
