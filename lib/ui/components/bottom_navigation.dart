import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:styx_booking/utils/router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  int getIndexFromRoute(String name) {
    switch (name) {
      case 'BooksRoute':
        return 0;
      case 'BookingsRoute':
        return 1;
      default:
        return 0;
    }
  }

  void navigateByIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.navigateTo(BooksRoute());
        break;
      case 1:
        context.navigateTo(BookingsRoute());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return BottomNavigationBar(
      onTap: (index) {
        navigateByIndex(context, index);
      },
      currentIndex: getIndexFromRoute(router.topRoute.name),
      items: [
        BottomNavigationBarItem(
          label: 'Books',
          icon: Icon(Icons.menu_book),
        ),
        BottomNavigationBarItem(
          label: 'Bookings',
          icon: Icon(Icons.bookmark),
        ),
      ],
    );
  }
}
