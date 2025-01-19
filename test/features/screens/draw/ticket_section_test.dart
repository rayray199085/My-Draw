import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_number_cell.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_section.dart';
import 'package:my_draw/generated/l10n.dart';

import '../../../utils/test_wrapper.dart';
import 'ticket_section_test.mocks.dart';

@GenerateMocks([
  DrawCubit,
])
void main() {
  late DrawCubit drawCubit;

  setUp(() {
    drawCubit = MockDrawCubit();
  });
  testWidgets(
      'Should render TicketSection with a title and 10 TicketNumberCell',
      (WidgetTester tester) async {
    when(drawCubit.state).thenReturn(const DrawState.loaded(
        ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        ballNumbers: [1, 2, 3]));
    when(drawCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      TestWrapper(
        child: BlocProvider(
          create: (context) => drawCubit,
          child: const Scaffold(
              body: TicketSection(
                  ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])),
        ),
      ),
    );

    expect(find.text('${S.current.ticketNumbers}:'), findsOneWidget);
    expect(find.byType(TicketNumberCell), findsNWidgets(10));
  });
}
