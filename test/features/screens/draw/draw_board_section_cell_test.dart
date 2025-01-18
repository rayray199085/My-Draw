import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_cell.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets(
      'Should render DrawBoardSectionCell with text when it is selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: DrawBoardSectionCell(
          number: 1,
          isSelected: false,
        )),
      ),
    );

    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: DrawBoardSectionCell(
          number: 1,
          isSelected: true,
        )),
      ),
    );

    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets(
      'Should render DrawBoardSectionCell without text when it is not selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(body: DrawBoardSectionCell(number: 4)),
      ),
    );

    expect(find.text('4'), findsNothing);
  });
}
