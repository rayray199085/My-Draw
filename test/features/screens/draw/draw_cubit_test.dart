import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';

void main() {
  blocTest(
    'Should emit a loaded state with ticketNumbers when calling loadTicketNumbers function',
    build: () {
      return DrawCubit();
    },
    act: (cubit) => cubit.loadTicketNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
    seed: () => const DrawState.initial(),
    expect: () => [
      const DrawState.loaded(
          ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], ballNumbers: []),
    ],
  );

  blocTest<DrawCubit, DrawState>(
    'Should emit 10 loaded states with updated draw ball numbers when calling drawBalls function',
    build: () {
      return DrawCubit();
    },
    act: (cubit) => cubit.drawBalls(),
    seed: () => const DrawState.loaded(
        ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], ballNumbers: []),
    expect: () {
      return List.generate(
        10,
        (index) => predicate<DrawState>(
            (state) => state.map(initial: (_) => false, loaded: (_) => true)),
      );
    },
    verify: (cubit) {
      final state = cubit.state;
      expect(state, isA<DrawState>());
      final ballNumbers = state.maybeMap(
          loaded: (loaded) => loaded.ballNumbers, orElse: () => []);
      expect(ballNumbers.length, 10);
      expect(ballNumbers.toSet().length, 10);
    },
    wait: const Duration(seconds: 20),
  );
}
