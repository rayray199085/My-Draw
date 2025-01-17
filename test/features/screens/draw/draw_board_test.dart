import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_header.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section.dart';

import '../../../utils/screen_test_wrapper.dart';

import 'draw_board_test.mocks.dart';

@GenerateMocks([
  DrawCubit,
])
void main() {
  late DrawCubit drawCubit;

  setUp(() {
    drawCubit = MockDrawCubit();
  });
  testWidgets(
      'Should render DrawBoard with a DrawBoardHeader and 2 DrawBoardSection',
      (WidgetTester tester) async {
    when(drawCubit.state).thenReturn(const DrawState.loaded(
        ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        ballNumbers: [1, 2, 3]));
    when(drawCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => drawCubit,
          child: const Scaffold(body: DrawBoard()),
        ),
      ),
    );

    expect(find.byType(DrawBoardHeader), findsOneWidget);
    expect(find.byType(DrawBoardSection), findsNWidgets(2));
  });
}
