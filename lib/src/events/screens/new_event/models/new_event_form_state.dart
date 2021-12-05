import 'package:dormamu/src/events/models/event.dart';
import 'package:flutter/material.dart';

/// Stores values from [NewEventForm].
class NewEventFormState extends ChangeNotifier {
  /// The name of the new event.
  String? eventName;

  /// A short description of the event.
  String? eventDescription;

  /// The type of event the new event will be. See [EventType].
  EventType? _eventType;

  /// The date of the new event.
  DateTime? eventDate;

  /// The time of the new event.
  TimeOfDay? eventTime;

  EventType? get eventType => _eventType;

  set eventType(EventType? eventType) {
    _eventType = eventType;

    notifyListeners();
  }
}
