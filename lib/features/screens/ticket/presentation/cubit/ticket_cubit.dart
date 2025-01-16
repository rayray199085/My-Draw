import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen_constants.dart';

import '../../../../../core/constants/app_constants.dart';

part 'ticket_state.dart';
part 'ticket_cubit.freezed.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(const TicketState(selectedNumbers: []));

  void updateSelectedNumbers({required int newNumber}) {
    final selectedNumbers = state.selectedNumbers;
    final index = selectedNumbers.indexOf(newNumber);
    if (index == -1 &&
        selectedNumbers.length < TicketScreenConstants.maxSelectedNumber) {
      // the number has not been selected yet and user can select more numbers
      emit(state.copyWith(selectedNumbers: [...selectedNumbers, newNumber]));
    } else {
      // if number exists, remove it from the selection list
      emit(state.copyWith(
          selectedNumbers:
              selectedNumbers.where((n) => n != newNumber).toList()));
    }
  }

  void clearSelectedNumbers() => emit(state.copyWith(selectedNumbers: []));

  void autoGenerateTicketNumbers() {
    final List<int> ticketNumbers =
        List.generate(AppConstants.totalTicketNumber, (index) => index + 1);
    final List<int> generatedNumbers = [];
    final random = Random();
    for (var i = 0; i < TicketScreenConstants.maxSelectedNumber; i++) {
      final index = random.nextInt(ticketNumbers.length);
      final number = ticketNumbers.removeAt(index);
      generatedNumbers.add(number);
    }
    emit(state.copyWith(selectedNumbers: generatedNumbers));
  }
}
