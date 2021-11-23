import 'package:dormamu/src/events/models/event.dart';
import 'package:flutter/material.dart';

import 'event_card.dart';

/// Displays a [ListView] of [EventCard]s for every [_events].
class EventList extends StatelessWidget {
  /// Default constructor
  const EventList({
    Key? key,
    required List<Event> events,
  })  : _events = events,
        super(key: key);

  /// [Events] to display in [ListView].
  final List<Event> _events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _events.length,
        itemBuilder: (_, int index) {
          // Get the current event by index
          final event = _events[index];

          // Crate event card for the current event
          return EventCard(
            key: ValueKey(event.id),
            event: event,
          );
        });
  }
}
