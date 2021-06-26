// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:styx_booking/ui/screens/bookings.dart' as _i4;
import 'package:styx_booking/ui/screens/books.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    BooksRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.BooksScreen();
        }),
    BookingsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.BookingsScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(BooksRoute.name, path: '/'),
        _i1.RouteConfig(BookingsRoute.name, path: '/bookings-screen')
      ];
}

class BooksRoute extends _i1.PageRouteInfo {
  const BooksRoute() : super(name, path: '/');

  static const String name = 'BooksRoute';
}

class BookingsRoute extends _i1.PageRouteInfo {
  const BookingsRoute() : super(name, path: '/bookings-screen');

  static const String name = 'BookingsRoute';
}
