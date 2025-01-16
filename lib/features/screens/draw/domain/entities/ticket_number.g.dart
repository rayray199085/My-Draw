// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketNumberImpl _$$TicketNumberImplFromJson(Map<String, dynamic> json) =>
    _$TicketNumberImpl(
      value: (json['value'] as num).toInt(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$TicketNumberImplToJson(_$TicketNumberImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'isSelected': instance.isSelected,
    };
