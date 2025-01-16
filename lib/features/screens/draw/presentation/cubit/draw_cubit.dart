import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_draw/features/screens/draw/domain/entities/ticket_number.dart';

part 'draw_state.dart';
part 'draw_cubit.freezed.dart';

class DrawCubit extends Cubit<DrawState> {
  DrawCubit() : super(const DrawState.initial());

  void loadTicketNumbers(List<int> numbers) {
    final List<int> numberList = [...numbers]
      ..sort(); // Spread operator creates a copy before sorting
    emit(DrawState.loaded(
      ticketNumbers: numberList.map((n) => TicketNumber(value: n)).toList(),
    ));
  }
}
