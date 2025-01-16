import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ball_section.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section.dart';

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
    return BlocListener<DrawCubit, DrawState>(
      // when loaded ticket number, start to draw
      listenWhen: (previous, current) =>
          previous.maybeMap(initial: (_) => true, orElse: () => false) &&
          current.maybeMap(loaded: (_) => true, orElse: () => false),
      listener: (context, state) => context.read<DrawCubit>().drawBalls(),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gaps.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocSelector<DrawCubit, DrawState, List<int>?>(
                selector: (state) => state.maybeMap(
                    loaded: (loaded) => loaded.ballNumbers, orElse: () => null),
                builder: (context, ballNumbers) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Gaps.spacing16),
                    child: BallSection(numbers: ballNumbers ?? []),
                  );
                },
              ),
              BlocSelector<DrawCubit, DrawState, List<int>?>(
                selector: (state) => state.maybeMap(
                    loaded: (loaded) => loaded.ticketNumbers,
                    orElse: () => null),
                builder: (context, ticketNumbers) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Gaps.spacing16),
                    child: TicketSection(numbers: ticketNumbers ?? []),
                  );
                },
              ),
              const DrawBoard(),
            ],
          ),
        ),
      )),
    );
  }
}
