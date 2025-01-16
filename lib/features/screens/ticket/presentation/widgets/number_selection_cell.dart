import 'package:flutter/material.dart';

import '../../../../../core/theme/radius_values.dart';

class NumberSelectionCell extends StatelessWidget {
  const NumberSelectionCell({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.black45,
          borderRadius:
              BorderRadius.all(Radius.circular(RadiusValues.circular4)),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
