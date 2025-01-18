import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_cell.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../utils/screen_test_wrapper.dart';
import 'draw_board_section_test.mocks.dart';

@GenerateMocks([
  DrawCubit,
])
void main() {
  late DrawCubit drawCubit;

  setUp(() {
    drawCubit = MockDrawCubit();
  });
  testWidgets(
      'Should render DrawBoardSection with a DrawBoardSectionLabel and 40 DrawBoardSectionCell',
      (WidgetTester tester) async {
    when(drawCubit.state).thenReturn(const DrawState.loaded(
        ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        ballNumbers: [1, 2, 3]));
    when(drawCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => drawCubit,
          child: const Scaffold(
              body: DrawBoardSection(
            itemsCount: 40,
            sectionType: DrawBoardSectionType.heads,
            height: 200.0,
            ballNumbers: [1, 2, 3, 4, 5],
          )),
        ),
      ),
    );

    expect(find.byType(DrawBoardSectionLabel), findsOneWidget);
    expect(find.byType(DrawBoardSectionCell), findsNWidgets(40));
  });
}
