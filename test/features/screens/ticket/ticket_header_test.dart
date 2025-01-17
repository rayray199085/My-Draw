import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/icon_text_button.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/ticket_header.dart';

import '../../../utils/screen_test_wrapper.dart';

void main() {
  testWidgets('Should render TicketHeader with 2 IconTextButton',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ScreenTestWrapper(
        child: Scaffold(body: TicketHeader()),
      ),
    );

    expect(find.byType(IconTextButton), findsNWidgets(2));
  });
}
