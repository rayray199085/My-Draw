import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_cell.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets(
      'Should render DrawBoardSection with a DrawBoardSectionLabel and 40 DrawBoardSectionCell',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const TestWrapper(
        child: Scaffold(
            body: DrawBoardSection(
          sectionType: DrawBoardSectionType.heads,
          height: 200.0,
          ballNumbers: [1, 2, 3, 4, 5],
        )),
      ),
    );

    expect(find.byType(DrawBoardSectionLabel), findsOneWidget);
    expect(find.byType(DrawBoardSectionCell), findsNWidgets(40));
  });
}
