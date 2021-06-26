import 'package:flutter/material.dart';
import 'package:styx/styx.dart';
import 'package:styx_flutter/styx_flutter.dart';

import 'package:styx_booking/components/book.dart';
import 'package:styx_booking/systems/systems.dart';
import 'package:styx_booking/utils/router.dart';

void createBooks() {
  var book = system.create();
  book += BookComponent(
      title: 'Fifth Sun',
      isbn: '9780190673062',
      authorName: 'Townsend, Camilla');

  var book2 = system.create();
  book2 += BookComponent(
      title: 'Empire of Horses',
      isbn: '9781643133270',
      authorName: 'Man, John');

  var book3 = system.create();
  book3 += BookComponent(
      title: 'The History of the Ancient World',
      isbn: '9780393059748',
      authorName: 'Bauer, Susan Wise');
}

final _router = AppRouter();

void main() {
  createBooks();
  runApp(BookingApp());
}

class BookingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EntityProvider<BookSystem>(
      system: system,
      child: MaterialApp.router(
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        title: 'Booking App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
      ),
    );
  }
}
