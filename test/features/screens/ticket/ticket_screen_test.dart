import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/core/router/app_route.dart';
import 'package:my_draw/features/screens/draw/presentation/draw_screen.dart';
import 'package:my_draw/features/screens/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/number_selection_board.dart';
import 'package:my_draw/features/screens/ticket/presentation/widgets/ticket_header.dart';
import 'package:my_draw/generated/l10n.dart';

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

  testWidgets('Should render DrawScreen when tap on ElevatedButton',
      (WidgetTester tester) async {
    when(ticketCubit.state).thenReturn(
        const TicketState(selectedNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
    when(ticketCubit.stream).thenAnswer((_) => const Stream.empty());

    final router = GoRouter(
      initialLocation: const TicketRoute().location,
      routes: [
        GoRoute(
          path: const TicketRoute().location,
          builder: (context, state) => BlocProvider<TicketCubit>(
            create: (_) => ticketCubit,
            child: const Scaffold(
              body: TicketBody(),
            ),
          ),
        ),
        GoRoute(
          path: const DrawRoute().location,
          builder: (context, state) => DrawScreen(
            ticketNumbers: state.extra as List<int>,
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: const [
          S.delegate,
        ],
      ),
    );

    await tester.dragUntilVisible(find.byType(ElevatedButton),
        find.byType(SingleChildScrollView), const Offset(0, 300.0));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(DrawScreen), findsOneWidget);
  });
}
