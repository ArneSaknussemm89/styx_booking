import 'package:flutter/material.dart';
import 'package:styx/styx.dart';
import 'package:styx_flutter/styx_flutter.dart';

import '../../components/book.dart';
import '../../components/bookings.dart';
import '../../systems/systems.dart';
import '../components/bottom_navigation.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watchFilteredEntities<BookSystem>(
        matcher: EntityMatcher(all: Set.of([BookComponent])),
        builder: (context, matcher, bookings) {
          if (bookings.isEmpty) return Text('You have no bookings yet');
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              var entity = bookings[index];
              return ListTile(
                onLongPress: () async {
                  final createBooking = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(
                            'Book "${entity.get<BookComponent>().title()}"?'),
                        actions: [
                          OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('CANCEL'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text('CONFIRM'),
                          ),
                        ],
                      );
                    },
                  );

                  if (createBooking != null && createBooking) {
                    entity += BookingComponent(
                      bookedOn: DateTime.now(),
                      dueBack: DateTime.now().add(Duration(days: 7)),
                    );
                  }
                },
                title: entity.get<BookComponent>().title.styx(
                      (data) => Text(data,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                subtitle: entity.styx(
                  (data) {
                    if (entity.has<BookingComponent>()) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                  'Booked on: ${entity.get<BookingComponent>().formattedBookedOn}')),
                          Expanded(
                              child: Text(
                                  'Due back: ${entity.get<BookingComponent>().formattedDueBack}')),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                trailing: entity.styx((data) {
                  if (data.has<BookingComponent>()) {
                    return Icon(Icons.bookmark);
                  }

                  return const SizedBox.shrink();
                }),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
