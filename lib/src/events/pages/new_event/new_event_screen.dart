import 'package:dormamu/src/events/models/event_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/new_event_form_state.dart';
import 'widgets/create_event_fab.dart';
import 'widgets/new_event_form.dart';

/// Allows the user to create a new [Event] via the [NewEventForm].
class NewEventScreen extends StatelessWidget {
  /// Default constructor
  const NewEventScreen({
    Key? key,
    required this.eventListState,
  }) : super(key: key);

  /// Used to add the new [Event] to the list of events.
  final EventListState eventListState;

  @override
  Widget build(_) {
    // Create key to control NewEventForm
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // Create form state
    return ChangeNotifierProvider(
        create: (_) => NewEventFormState(),
        builder: (BuildContext context, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('New Event')),
            body: NewEventForm(
              formKey: formKey,
            ),
            floatingActionButton: CreateEventFAB(
                formKey: formKey, eventListState: eventListState),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}
