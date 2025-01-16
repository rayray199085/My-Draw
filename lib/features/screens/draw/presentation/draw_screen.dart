import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/domain/entities/ticket_number.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
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
      body: BlocProvider(
        create: (context) => DrawCubit()..loadTicketNumbers(ticket.numbers),
        child: const DrawBody(),
      ),
    );
  }
}

@visibleForTesting
class DrawBody extends StatelessWidget {
  const DrawBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Gaps.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<DrawCubit, DrawState, List<TicketNumber>?>(
              selector: (state) => state.maybeMap(
                  loaded: (loaded) => loaded.ticketNumbers, orElse: () => null),
              builder: (context, ticketNumbers) {
                return ticketNumbers?.isNotEmpty == true
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: Gaps.spacing16),
                        child: TicketSection(numbers: ticketNumbers!),
                      )
                    : const SizedBox();
              },
            ),
            const DrawBoard(),
          ],
        ),
      ),
    ));
  }
}
