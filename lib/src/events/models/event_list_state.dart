import 'package:flutter/material.dart';

import 'event.dart';

class EventListState extends ChangeNotifier {
  final List<Event> _events = <Event>[
    Event(
      id: 0,
      name: "Dormamu Release Party",
      description: "Join the Dormamu tem as we unveil our new app!",
      location: "Somewhere",
      organizer: "try again later",
      eventType: EventType.community,
      startDate: DateTime.now(),
      likes: 99,
    ),
    Event(
      id: 1,
      name: "Developer Party",
      description: "Great work! Developer only party this Friday!",
      location: "over",
      organizer: 'somebody',
      eventType: EventType.private,
      startDate: DateTime.now(),
      likes: 49,
    ),
    Event(
      id: 2,
      name: "Welcome Week 2021",
      description: "Welcome to Drexel!",
      location: "rainbow",
      organizer: 'idk',
      eventType: EventType.community,
      startDate: DateTime.now(),
      likes: 999,
    ),
  ];

  void addEvent(Event event) {
    _events.add(event);

    notifyListeners();
  }

  List<Event> getEventsByType(EventType type) {
    return _events.where((Event event) {
      return event.eventType == type;
    }).toList();
  }
}
