import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_content.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_header.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets(
      'Should render DrawBoard with a DrawBoardHeader and a DrawBoardContent',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: DrawBoard(
          ballNumbers: [1, 2, 3],
        )),
      ),
    );

    expect(find.byType(DrawBoardHeader), findsOneWidget);
    expect(find.byType(DrawBoardContent), findsOneWidget);
  });
}
