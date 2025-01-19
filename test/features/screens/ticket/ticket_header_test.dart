import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen_constants.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/icon_text_button.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/ticket_header.dart';
import 'package:my_draw/generated/l10n.dart';

import '../../../utils/test_wrapper.dart';

void main() {
  testWidgets('Should render TicketHeader with 2 IconTextButton',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const TestWrapper(
        child: Scaffold(body: TicketHeader()),
      ),
    );

    expect(find.byType(IconTextButton), findsNWidgets(2));
    expect(
        find.text(
            S.current.pickNumbers(TicketScreenConstants.maxSelectedNumber)),
        findsOneWidget);
  });

  testWidgets(
      'Should render TicketHeader with 2 IconTextButton when one number remaining',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestWrapper(
        child: Scaffold(
            body: TicketHeader(
          numberCount: TicketScreenConstants.maxSelectedNumber - 1,
        )),
      ),
    );

    expect(find.byType(IconTextButton), findsNWidgets(2));
    expect(find.text(S.current.pickOneNumber), findsOneWidget);
  });

  testWidgets(
      'Should render TicketHeader with 2 IconTextButton when max number being selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestWrapper(
        child: Scaffold(
            body: TicketHeader(
          numberCount: TicketScreenConstants.maxSelectedNumber,
        )),
      ),
    );

    expect(find.byType(IconTextButton), findsNWidgets(2));
    expect(find.text(S.current.allDone), findsOneWidget);
  });
}
