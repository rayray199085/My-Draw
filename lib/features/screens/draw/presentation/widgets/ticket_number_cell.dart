import 'package:flutter/material.dart';
import 'package:my_draw/features/screens/draw/domain/entities/ticket_number.dart';

import '../../../../../core/theme/radius_values.dart';

class _TicketNumberCellConstants {
  static const double cellSize = 32.0;
}

class TicketNumberCell extends StatelessWidget {
  const TicketNumberCell({
    super.key,
    required this.number,
  });
  final TicketNumber number;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _TicketNumberCellConstants.cellSize,
        height: _TicketNumberCellConstants.cellSize,
        decoration: BoxDecoration(
            color: number.isSelected
                ? Theme.of(context).colorScheme.tertiary
                : null,
            borderRadius: BorderRadius.circular(RadiusValues.circular4),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
            )),
        alignment: Alignment.center,
        child: Text(
          number.value.toString(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: number.isSelected
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.secondary,
              ),
        ));
  }
}
