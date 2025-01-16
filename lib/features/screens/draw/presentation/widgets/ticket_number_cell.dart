import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';

import '../../../../../core/theme/radius_values.dart';

class _TicketNumberCellConstants {
  static const double cellSize = 32.0;
}

class TicketNumberCell extends StatelessWidget {
  const TicketNumberCell({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DrawCubit, DrawState, bool>(
      selector: (state) => state.maybeMap(
          loaded: (loaded) => loaded.ballNumbers.contains(number),
          orElse: () => false),
      builder: (context, isSelected) {
        return Container(
            width: _TicketNumberCellConstants.cellSize,
            height: _TicketNumberCellConstants.cellSize,
            decoration: BoxDecoration(
                color:
                    isSelected ? Theme.of(context).colorScheme.tertiary : null,
                borderRadius: BorderRadius.circular(RadiusValues.circular4),
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                )),
            alignment: Alignment.center,
            child: Text(
              number.toString(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.secondary,
                  ),
            ));
      },
    );
  }
}
