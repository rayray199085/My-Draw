import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets('Should render DrawBoardSectionLabel with a text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const TestWrapper(
        child: Scaffold(body: DrawBoardSectionLabel(text: 'Heads')),
      ),
    );

    expect(find.text('Heads'), findsOneWidget);
  });
}
