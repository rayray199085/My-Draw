import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/domain/entities/ticket_number.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_number_cell.dart';

class TicketSection extends StatelessWidget {
  const TicketSection({
    super.key,
    required this.numbers,
  });

  final List<TicketNumber> numbers;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: Gaps.spacing8,
      runSpacing: Gaps.spacing8,
      children:
          numbers.map((number) => TicketNumberCell(number: number)).toList(),
    );
  }
}
