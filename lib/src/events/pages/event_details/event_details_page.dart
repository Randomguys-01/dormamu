import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../../pages/event_details/widgets/event_details_body.dart';

/// Creates the structure to show the details about an [Event]. The main content
/// is populated by the [EventDetailsBody].
///
/// Structure:
///   * [Scaffold.appBar] - Displays the name of the [Event], [_event].
///   * [Scaffold.body] - Displays the [EventDetailsBody].
class EventDetailsPage extends StatelessWidget {
  /// Default constructor.
  ///
  /// Parameters:
  ///   * [event] - The [Event] this screen is displaying details about.
  const EventDetailsPage({
    Key? key,
    required Event event,
  })  : _event = event,
        super(key: key);

  /// The [Event] this screen is displaying details about. Used to populate the
  /// fields.
  final Event _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Simple app bar. Title is the name of the event
      appBar: AppBar(title: Text(_event.name)),

      // Main body shows details about the event
      body: EventDetailsBody(event: _event),
    );
  }
}
