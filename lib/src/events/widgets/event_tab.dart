import 'package:dormamu/src/events/models/event.dart';
import 'package:dormamu/src/events/models/event_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_list.dart';

/// Displays all events for a given [EventType].
class EventTab extends StatelessWidget {
  const EventTab({
    Key? key,
    required EventType eventType,
  })  : _eventType = eventType,
        super(key: key);

  /// Stores the type of event this tab represents.
  final EventType _eventType;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventListState>(builder: (_, listState, __) {
      return EventList(
        events: listState.getEventsByType(_eventType),
      );
    });
  }
}
