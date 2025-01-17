import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_board.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/ticket_header.dart';

import '../../../utils/screen_test_wrapper.dart';
import 'ticket_screen_test.mocks.dart';

@GenerateMocks([
  TicketCubit,
])
void main() {
  late TicketCubit ticketCubit;

  setUp(() {
    ticketCubit = MockTicketCubit();
  });

  testWidgets('Should render TicketScreen with AppBar and Scaffold',
      (WidgetTester tester) async {
    when(ticketCubit.state)
        .thenReturn(const TicketState(selectedNumbers: [1, 2, 3, 4, 5]));
    when(ticketCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => ticketCubit,
          child: const TicketScreen(),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
      'Should render TicketBody with TicketHeader, NumberSelectionBoard and ElevatedButton',
      (WidgetTester tester) async {
    when(ticketCubit.state)
        .thenReturn(const TicketState(selectedNumbers: [1, 2, 3, 4, 5]));
    when(ticketCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => ticketCubit,
          child: const Scaffold(body: TicketBody()),
        ),
      ),
    );

    expect(find.byType(TicketHeader), findsOneWidget);
    expect(find.byType(NumberSelectionBoard), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
