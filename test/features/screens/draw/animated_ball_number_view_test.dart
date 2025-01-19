import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/animated_ball_number_view.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets('Should render AnimatedBallNumberView with the number text label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const TestWrapper(
        child:
            Scaffold(body: AnimatedBallNumberView(number: 1, maxWidth: 400.0)),
      ),
    );

    expect(find.text('1'), findsOneWidget);
  });
}
