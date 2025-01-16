import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_draw/core/router/app_route.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen_constants.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/icon_text_button.dart';
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
    return BlocSelector<TicketCubit, TicketState, List<int>>(
      selector: (state) => state.selectedNumbers,
      builder: (context, selectedNumbers) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Gaps.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: Gaps.spacing16,
              children: [
                Row(
                  spacing: Gaps.spacing8,
                  children: [
                    IconTextButton(
                      icon: Icons.clear,
                      label: S.of(context).clear,
                      onTap: () =>
                          context.read<TicketCubit>().clearSelectedNumbers(),
                    ),
                    IconTextButton(
                      icon: Icons.vibration,
                      label: S.of(context).auto,
                      onTap: () => context
                          .read<TicketCubit>()
                          .autoGenerateTicketNumbers(),
                    )
                  ],
                ),
                NumberSelectionBoard(selectedNumbers: selectedNumbers),
                ElevatedButton(
                    onPressed: selectedNumbers.length ==
                            TicketScreenConstants.maxSelectedNumber
                        ? () => context.push(const DrawRoute().location,
                            extra: selectedNumbers)
                        : null,
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
