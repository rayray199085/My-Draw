import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';

void main() {
  blocTest(
    'Should emit a new state with new number when calling updateSelectedNumbers function and selected numbers count is less than the max count',
    build: () {
      return TicketCubit();
    },
    act: (cubit) => cubit.updateSelectedNumbers(newNumber: 2),
    seed: () => const TicketState(selectedNumbers: [1]),
    expect: () => [
      const TicketState(selectedNumbers: [1, 2]),
    ],
  );

  blocTest(
    'Should not emit a new state with new number when calling updateSelectedNumbers function and selected numbers count is equal to the max count',
    build: () {
      return TicketCubit();
    },
    act: (cubit) => cubit.updateSelectedNumbers(newNumber: 11),
    seed: () =>
        const TicketState(selectedNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
    expect: () => [],
  );

  blocTest(
    'Should emit a new state without new number when calling updateSelectedNumbers function and selected numbers count is less than the max count',
    build: () {
      return TicketCubit();
    },
    act: (cubit) => cubit.updateSelectedNumbers(newNumber: 2),
    seed: () => const TicketState(selectedNumbers: [1, 2]),
    expect: () => [
      const TicketState(selectedNumbers: [1]),
    ],
  );

  blocTest(
    'Should emit a new state with empty selected number list when calling clearSelectedNumbers function',
    build: () {
      return TicketCubit();
    },
    act: (cubit) => cubit.clearSelectedNumbers(),
    seed: () => const TicketState(selectedNumbers: [1, 2]),
    expect: () => [
      const TicketState(selectedNumbers: []),
    ],
  );

  blocTest(
    'Should emit a new state with auto generated numbers when calling autoGenerateTicketNumbers function',
    build: () {
      return TicketCubit();
    },
    act: (cubit) => cubit.autoGenerateTicketNumbers(),
    seed: () => const TicketState(selectedNumbers: [1, 2]),
    expect: () => [
      isA<TicketState>(),
    ],
  );
}
