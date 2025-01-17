import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_cell.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets(
      'Should render NumberSelectionCell with a text and it is clickable',
      (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: Scaffold(
            body: NumberSelectionCell(
          label: '1',
          onTap: () => counter++,
        )),
      ),
    );

    expect(find.byType(Text), findsOneWidget);

    await tester.tap(find.byType(Text));
    await tester.pump();

    expect(counter, 1);
  });
}
