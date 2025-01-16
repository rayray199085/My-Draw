part of 'draw_cubit.dart';

@freezed
class DrawState with _$DrawState {
  const factory DrawState.initial() = _Initial;
  const factory DrawState.loaded({
    required List<TicketNumber> ticketNumbers,
    required List<int> ballNumbers,
  }) = _Loaded;
}
