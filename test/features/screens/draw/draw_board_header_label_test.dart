import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_header_label.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets(
      'Should render DrawBoardHeaderLabel with a title and a count text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const TestWrapper(
        child: Scaffold(
            body: DrawBoardHeaderLabel(
          type: DrawBoardSectionType.heads,
          count: 1,
          width: 100.0,
        )),
      ),
    );

    expect(find.text('Heads'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });
}
