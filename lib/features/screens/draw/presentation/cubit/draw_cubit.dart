import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_draw/core/constants/app_constants.dart';

import '../draw_screen_constants.dart';

part 'draw_state.dart';
part 'draw_cubit.freezed.dart';

class DrawCubit extends Cubit<DrawState> {
  DrawCubit() : super(const DrawState.initial());
  late final Timer timer;

  void loadTicketNumbers(List<int> numbers) {
    emit(DrawState.loaded(
      ticketNumbers: [...numbers]..sort(),
      ballNumbers: [],
    ));
  }

  void drawBalls() {
    final List<int> ballNumbers =
        List.generate(AppConstants.totalTicketNumber, (index) => index + 1);
    final random = Random();
    timer = Timer.periodic(
        const Duration(seconds: DrawScreenConstants.drawBallInterval), (t) {
      state.maybeMap(
          loaded: (loaded) {
            if (loaded.ballNumbers.length < DrawScreenConstants.maxBallCount) {
              final index = random.nextInt(ballNumbers.length);
              final selectedBall = ballNumbers.removeAt(index);
              emit(loaded.copyWith(
                  ballNumbers: [...loaded.ballNumbers, selectedBall]));
            } else {
              timer.cancel();
            }
          },
          orElse: () {});
    });
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
