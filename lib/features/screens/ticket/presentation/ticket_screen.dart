import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_draw/core/router/app_route.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/ticket/domain/entities/ticket.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_board.dart';

import '../../../../generated/l10n.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ticket),
      ),
      body: BlocProvider(
        create: (context) => TicketCubit(),
        child: const TicketBody(),
      ),
    );
  }
}

@visibleForTesting
class TicketBody extends StatelessWidget {
  const TicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TicketCubit, TicketState, Ticket>(
      selector: (state) => state.ticket,
      builder: (context, ticket) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Gaps.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberSelectionBoard(selectedNumbers: ticket.numbers),
                const SizedBox(height: Gaps.spacing16),
                ElevatedButton(
                    onPressed: () =>
                        context.push(const DrawRoute().location, extra: ticket),
                    // onPressed: selectedNumbers.length ==
                    //         TicketScreenConstants.maxSelectedNumber
                    //     ? () => DrawRoute().push(context)
                    //     : null,
                    child: Text(
                      S.of(context).start,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ))
              ],
            ),
          ),
        ));
      },
    );
  }
}
