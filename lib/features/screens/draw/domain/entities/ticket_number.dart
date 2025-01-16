import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_number.freezed.dart';
part 'ticket_number.g.dart';

@freezed
class TicketNumber with _$TicketNumber {
  const factory TicketNumber({
    required int value,
    @Default(false) bool isSelected,
  }) = _TicketNumber;

  factory TicketNumber.fromJson(Map<String, dynamic> json) =>
      _$TicketNumberFromJson(json);
}
