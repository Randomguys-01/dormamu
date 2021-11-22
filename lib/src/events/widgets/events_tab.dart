import 'package:dormamu/src/events/models/event.dart';
import 'package:flutter/material.dart';

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
    return Center(child: Text('$_eventType'));
  }
}
