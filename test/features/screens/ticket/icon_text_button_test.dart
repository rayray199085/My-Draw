import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/icon_text_button.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets('Should render IconTextButton with an icon and a text',
      (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWidget(
      TestWrapper(
        child: Scaffold(
            body: IconTextButton(
          icon: Icons.clear,
          label: 'Clear',
          onTap: () => counter++,
        )),
      ),
    );

    expect(find.byIcon(Icons.clear), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);

    await tester.tap(find.byType(Text));
    await tester.pump();

    expect(counter, 1);
  });
}
