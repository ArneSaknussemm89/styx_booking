// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingComponent _$BookingComponentFromJson(Map<String, dynamic> json) {
  return BookingComponent(
    bookedOn: DateTime.parse(json['bookedOn'] as String),
    dueBack: DateTime.parse(json['dueBack'] as String),
  );
}

Map<String, dynamic> _$BookingComponentToJson(BookingComponent instance) =>
    <String, dynamic>{
      'bookedOn': instance.bookedOn,
      'dueBack': instance.dueBack,
    };
