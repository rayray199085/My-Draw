import 'package:flutter/material.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_number_cell.dart';

import '../../../../../../core/theme/gaps.dart';
import '../../../../../../generated/l10n.dart';

class TicketSection extends StatelessWidget {
  const TicketSection({
    super.key,
    required this.ticketNumbers,
  });

  final List<int> ticketNumbers;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Gaps.spacing8,
      children: [
        Text(
          '${S.of(context).ticketNumbers}:',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: Gaps.spacing8,
          runSpacing: Gaps.spacing8,
          children: ticketNumbers
              .map((number) => TicketNumberCell(number: number))
              .toList(),
        ),
      ],
    );
  }
}
