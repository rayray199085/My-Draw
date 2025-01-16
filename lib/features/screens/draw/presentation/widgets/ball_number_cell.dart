import 'package:flutter/material.dart';

import '../../../../../core/theme/radius_values.dart';

class _BallNumberCellConstants {
  static const double cellSize = 32.0;
}

class BallNumberCell extends StatelessWidget {
  const BallNumberCell({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _BallNumberCellConstants.cellSize,
        height: _BallNumberCellConstants.cellSize,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
        ),
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ));
  }
}
