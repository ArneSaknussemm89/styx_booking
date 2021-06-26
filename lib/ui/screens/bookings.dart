import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styx/styx.dart';
import 'package:styx_flutter/styx_flutter.dart';

import '../../components/book.dart';
import '../../components/bookings.dart';
import '../../systems/systems.dart';
import '../components/bottom_navigation.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  Future<bool?> confirmDeletion(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Are you sure you want to delete this booking?'),
          actions: [
            OutlinedButton(
              onPressed: () => context.router.pop(false),
              child: Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () => context.router.pop(true),
              child: Text('CONFIRM'),
            ),
          ],
        );
      },
    );
  }

  Widget buildBooking(BuildContext context, Rx<Entity> entity) {
    final booking = entity.get<BookingComponent>();
    final book = entity.get<BookComponent>();
    return ListTile(
      title: book.title.styx(
        (data) => Text(data, style: Theme.of(context).textTheme.headline6),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text('Booked on: ${booking.formattedBookedOn}')),
          Expanded(child: Text('Due back: ${booking.formattedDueBack}')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watchFilteredEntities<BookSystem>(
        matcher: EntityMatcher(all: Set.of([BookingComponent, BookComponent])),
        builder: (context, matcher, bookings) {
          if (bookings.isEmpty) return Text('You have no bookings yet');
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final entity = bookings[index];
              return Dismissible(
                key: ValueKey(entity),
                confirmDismiss: (direction) async {
                  final deleteBooking = await confirmDeletion(context);

                  if (deleteBooking != null && deleteBooking) {
                    bookings[index].value.destroy();
                    return true;
                  } else {
                    return false;
                  }
                },
                child: buildBooking(context, bookings[index]),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
