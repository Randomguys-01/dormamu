/// Describes the different types of possible events.
///
/// Possible Event Types:
///
/// * [community] - Community events are open to any user in the app.
/// * [private] - Private events are limited to certain groups of people. Events
/// could be as large as an entire floors (or larger) and as small as a group of
/// friends.
enum EventType { community, private }

/// Represents an Event that can be created on the app.
class Event {
  /// The id used to identify this event.
  final int id;

  /// The name or title of the event.
  final String name;

  /// A description of the event and event details.
  final String description;

  /// The type of event. See [EventType].
  final EventType eventType;

  /// The date and time the event starts.
  final DateTime startDate;

  /// The date and time the event ends.
  final DateTime endDate;

  /// The number of likes this event has.
  final int likes;

  /// Default constructor requires all fields.
  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.eventType,
    required this.startDate,
    required this.endDate,
    required this.likes,
  });
}
