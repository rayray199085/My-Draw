import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_section.dart';

import '../../../../generated/l10n.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({
    super.key,
    required this.ticketNumbers,
  });

  final List<int> ticketNumbers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).draw),
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = DrawCubit();
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => cubit.loadTicketNumbers(ticketNumbers));
          return cubit;
        },
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
    return BlocConsumer<DrawCubit, DrawState>(
      listenWhen: (previous, current) =>
          previous.maybeMap(initial: (_) => true, orElse: () => false) &&
          current.maybeMap(loaded: (_) => true, orElse: () => false),
      listener: (context, state) => context
          .read<DrawCubit>()
          .drawBalls(), // start to draw balls when state changes from initial to loaded
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Gaps.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Gaps.spacing16,
              children: [
                TicketSection(
                    ticketNumbers: state.maybeMap(
                        loaded: (loaded) => loaded.ticketNumbers,
                        orElse: () => [])),
                DrawBoard(
                    ballNumbers: state.maybeMap(
                        loaded: (loaded) => loaded.ballNumbers,
                        orElse: () => [])),
              ],
            ),
          ),
        ));
      },
    );
  }
}
