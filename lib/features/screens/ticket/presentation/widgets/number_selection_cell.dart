import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/cell_color_helper.dart';

import '../../../../../core/theme/radius_values.dart';

class NumberSelectionCell extends StatelessWidget {
  const NumberSelectionCell({
    super.key,
    required this.number,
    this.isSelected = false,
    this.onTap,
  });

  final int number;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const borderRadius =
        BorderRadius.all(Radius.circular(RadiusValues.circular4));
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: isSelected
              ? CellColorHelper.getCellBackgroundColor(number: number)
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: borderRadius,
        ),
        child: Align(
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
