part of 'ticket_cubit.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({required List<int> selectedNumbers}) =
      _TicketState;
}
