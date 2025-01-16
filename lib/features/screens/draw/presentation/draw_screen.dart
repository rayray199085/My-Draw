import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section.dart';
import 'package:my_draw/features/screens/ticket/domain/entities/ticket.dart';

import '../../../../generated/l10n.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({
    super.key,
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).draw),
      ),
      body: DrawBody(ticket: ticket),
    );
  }
}

@visibleForTesting
class DrawBody extends StatelessWidget {
  const DrawBody({
    super.key,
    required this.ticket,
  });
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Gaps.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketSection(numbers: ticket.numbers),
            const SizedBox(height: Gaps.spacing16),
            const DrawBoard(),
          ],
        ),
      ),
    ));
  }
}
