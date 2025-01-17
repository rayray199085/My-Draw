import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/draw_screen.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_number_cell.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/ticket_section/ticket_section.dart';

import '../../../utils/screen_test_wrapper.dart';
import 'draw_screen_test.mocks.dart';

@GenerateMocks([
  DrawCubit,
])
void main() {
  late DrawCubit drawCubit;

  setUp(() {
    drawCubit = MockDrawCubit();
  });

  testWidgets(
      'Should render DrawScreen with AppBar and Scaffold when drawCubit is in a initial state',
      (WidgetTester tester) async {
    when(drawCubit.state).thenReturn(const DrawState.initial());
    when(drawCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => drawCubit,
          child:
              const DrawScreen(ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
      'Should render DrawBody with TicketSection and DrawBoard when drawCubit is in a loaded state',
      (WidgetTester tester) async {
    when(drawCubit.state).thenReturn(const DrawState.loaded(
        ticketNumbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        ballNumbers: [1, 2, 3]));
    when(drawCubit.stream).thenAnswer((_) => const Stream.empty());
    await tester.pumpWidget(
      ScreenTestWrapper(
        child: BlocProvider(
          create: (context) => drawCubit,
          child: const Scaffold(body: DrawBody()),
        ),
      ),
    );

    expect(find.byType(TicketSection), findsOneWidget);
    expect(find.byType(TicketNumberCell), findsNWidgets(10));
  });
}
