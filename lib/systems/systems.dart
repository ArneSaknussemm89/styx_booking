import 'package:get/get.dart';
import 'package:styx/styx.dart';
import 'package:styx_booking/components/bookings.dart';

import '../components/book.dart';

class BookSystem extends EntitySystem {
  BookSystem() {
    registerDeserializer(componentsFromJson);
  }

  @override
  Rx<Entity> create() {
    var entity = super.create();

    /// Add the default component
    entity += BookComponent();
    return entity;
  }
}

Component? componentsFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'BookComponent':
      return BookComponent.fromJson(json['data']);
    case 'BookingComponent':
      return BookingComponent.fromJson(json['data']);
    case 'FavoriteComponent':
      return FavoriteComponent.fromJson(json['data']);
    default:
      return null;
  }
}

final system = BookSystem();
