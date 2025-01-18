import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_header.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_header_label.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets('Should render DrawBoardHeader with 2 DrawBoardHeaderLabel',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: DrawBoardHeader(
          labelWidth: 200.0,
          ballNumbers: [1, 2, 3, 4],
        )),
      ),
    );

    expect(find.byType(DrawBoardHeaderLabel), findsNWidgets(2));
  });
}
