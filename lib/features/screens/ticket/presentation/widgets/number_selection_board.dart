import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';

import '../../../../../core/theme/gaps.dart';
import '../ticket_screen_constants.dart';
import 'number_selection_cell.dart';

class NumberSelectionBoard extends StatelessWidget {
  const NumberSelectionBoard({
    super.key,
    required this.selectedNumbers,
  });
  final List<int> selectedNumbers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: TicketScreenConstants.boardCrossAxisCount,
        crossAxisSpacing: Gaps.spacing4,
        mainAxisSpacing: Gaps.spacing4,
      ),
      itemCount: TicketScreenConstants.totalNumberCount,
      itemBuilder: (context, index) {
        final number = index + 1; // starting from 1
        return NumberSelectionCell(
          label: number.toString(),
          isSelected: selectedNumbers.contains(number),
          onTap: () => context
              .read<TicketCubit>()
              .updateSelectedNumbers(newNumber: number),
        );
      },
    );
  }
}
