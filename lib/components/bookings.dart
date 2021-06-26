import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:styx/styx.dart';

part 'bookings.g.dart';

@JsonSerializable()
class BookingComponent extends Component
    with SerializableComponent, EquatableMixin {
  BookingComponent({
    required DateTime bookedOn,
    required DateTime dueBack,
  }) {
    this.bookedOn(bookedOn);
    this.dueBack(dueBack);
  }

  final bookedOn = DateTime.now().obs;
  final dueBack = DateTime.now().obs;

  String get formattedBookedOn =>
      DateFormat(DateFormat.YEAR_MONTH_DAY).format(bookedOn());
  String get formattedDueBack =>
      DateFormat(DateFormat.YEAR_MONTH_DAY).format(dueBack());

  @override
  List<Object?> get props => [bookedOn(), dueBack()];

  factory BookingComponent.fromJson(Map<String, dynamic> json) =>
      _$BookingComponentFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "bookedOn": bookedOn(),
      "dueBack": dueBack(),
    };
  }
}
