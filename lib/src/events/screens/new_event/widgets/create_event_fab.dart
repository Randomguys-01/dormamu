import 'package:dormamu/src/events/models/event.dart';
import 'package:dormamu/src/events/models/event_list_state.dart';
import 'package:dormamu/src/events/screens/new_event/models/new_event_form_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [FloatingActionButton.extended] triggers the creation of a new [Event].
class CreateEventFAB extends StatelessWidget {
  /// Default constructor
  const CreateEventFAB({
    Key? key,
    required this.formKey,
    required this.eventListState,
  }) : super(key: key);

  /// Form key controlling [NewEventForm].
  final GlobalKey<FormState> formKey;

  /// Used to add [Event].
  final EventListState eventListState;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Create Event'),
      icon: const Icon(Icons.event),
      onPressed: () => _createEvent(context),
    );
  }

  /// Creates an [Event] from [NewEventForm] and adds it to [EventListState].
  void _createEvent(BuildContext context) {
    // Validate form
    if (formKey.currentState!.validate()) {
      // Tell fields to save their values
      formKey.currentState!.save();

      // Get form details
      final newEventForm = Provider.of<NewEventFormState>(
        context,
        listen: false,
      );

      // Create an event from the form values and add to list
      eventListState.addEvent(Event(
        id: 4,
        name: newEventForm.eventName!,
        description: newEventForm.eventDescription!,
        eventType: newEventForm.eventType!,
        startDate: newEventForm.eventDate!,
        likes: 0,
      ));

      // Close NewEventScreen
      Navigator.pop(context);
    }
  }
}
