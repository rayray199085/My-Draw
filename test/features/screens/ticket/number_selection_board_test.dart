import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_board.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_cell.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets(
      'Should render NumberSelectionBoard with a grid view and 80 NumberSelectionCell',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(
            body: NumberSelectionBoard(selectedNumbers: [1, 2, 3, 4, 5])),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(NumberSelectionCell), findsNWidgets(80));
  });
}
