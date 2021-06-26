import 'package:auto_route/auto_route.dart';
import 'package:styx_booking/ui/screens/bookings.dart';
import 'package:styx_booking/ui/screens/books.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AdaptiveRoute(page: BooksScreen, initial: true),
    AdaptiveRoute(page: BookingsScreen),
  ],
)
class $AppRouter {}
