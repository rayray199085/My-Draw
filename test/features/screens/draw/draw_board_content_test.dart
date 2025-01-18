import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_content.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets('Should render DrawBoardContent with 2 DrawBoardSection',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: DrawBoardContent(
                boardSectionHeight: 217.0,
                width: 400.0,
                ballNumbers: [1, 2, 3])),
      ),
    );

    expect(find.byType(DrawBoardSection), findsNWidgets(2));
  });
}
