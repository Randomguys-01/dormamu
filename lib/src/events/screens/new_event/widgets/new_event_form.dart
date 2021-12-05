import 'package:dormamu/src/events/models/event.dart';
import 'package:dormamu/src/events/screens/new_event/models/new_event_form_state.dart';
import 'package:dormamu/src/utils/form_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewEventForm extends StatefulWidget {
  /// Default constructor
  const NewEventForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  /// FormKey is used for validation and saving of form field values.
  final GlobalKey<FormState> _formKey;

  @override
  State<NewEventForm> createState() => _NewEventFormState();
}

/// Creates a [Form] to used to create a new [Event].
class _NewEventFormState extends State<NewEventForm> with FormUtils {
  /// Controls the name field and allows for accessing it's value.
  late final TextEditingController _eventNameController;

  /// Controls the description field and allows for accessing it's value.
  late final TextEditingController _eventDescriptionController;

  /// Controls the date field and allows for accessing it's value.
  late final TextEditingController _eventDateController;

  /// Controls the time field and allows for accessing it's value.
  late final TextEditingController _eventTimeController;

  /// Create [TextEditingController]s.
  @override
  void initState() {
    _eventNameController = TextEditingController();
    _eventDescriptionController = TextEditingController();
    _eventDateController = TextEditingController();
    _eventTimeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get form state
    final formState = Provider.of<NewEventFormState>(context, listen: false);

    // Create form
    return Form(
      key: widget._formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          // Event Name field
          _buildNameField(formState, _eventNameController),
          const SizedBox(height: 10),

          // Event Description field
          _buildDescriptionField(formState, _eventDescriptionController),
          const SizedBox(height: 10),

          // Event Type field
          // TODO: Unnecessary but it would by cool to use a Selector here
          Consumer<NewEventFormState>(builder: (_, formState, __) {
            return _buildEventTypeDropdown(formState);
          }),
          const SizedBox(height: 10),

          // Event Date/Time fields
          Row(children: <Widget>[
            // Event Date field
            Expanded(
              child: _buildDatePicker(context, formState),
            ),
            const SizedBox(width: 16),

            // Event Time field
            Expanded(
              child: _buildTimePicker(context, formState),
            ),
          ]),
        ]),
      ),
    );
  }

  /// Builds a [TextFormField] for the user to enter the name of the event.
  TextFormField _buildNameField(
    NewEventFormState formState,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('Event Name*'),
      ),
      maxLength: 50,
      validator: (String? value) {
        // Validate input
        return stringValidator(value, 'Event Name', 50);
      },
      onSaved: (String? value) {
        // Validator prevents null value
        formState.eventName = value!;
      },
    );
  }

  /// Builds a [TextFormField] for the user to enter a description of the event.
  TextFormField _buildDescriptionField(
    NewEventFormState formState,
    TextEditingController controller,
  ) {
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          label: Text('Event Description*'),
        ),
        maxLength: 100,
        validator: (String? value) {
          // Validate input
          return stringValidator(value, 'Event Description', 100);
        },
        onSaved: (String? value) {
          // Validator prevents null value
          formState.eventDescription = value!;
        });
  }

  /// Builds a [DropdownButtonFormField] for the user to select an [EventType].
  DropdownButtonFormField<EventType> _buildEventTypeDropdown(
      NewEventFormState formState) {
    return DropdownButtonFormField<EventType>(
      hint: const Text('Event Type*'),
      decoration: InputDecoration(
        helperText: formState.eventType?.description ?? '',
      ),
      items: const <DropdownMenuItem<EventType>>[
        DropdownMenuItem<EventType>(
          value: EventType.community,
          child: Text('Community'),
        ),
        DropdownMenuItem<EventType>(
          value: EventType.private,
          child: Text('Private'),
        ),
      ],
      onChanged: (EventType? eventType) {
        // Update form state
        formState.eventType = eventType;
      },
      validator: (EventType? eventType) {
        if (eventType == null) {
          return "Event Type is required";
        } else {
          return null;
        }
      },
      onSaved: (EventType? eventType) {
        // Validator prevents null value
        formState.eventType = eventType;
      },
    );
  }

  /// Builds a [TextFormField] that shows a [DatePickerDialog] on tap.
  TextFormField _buildDatePicker(
    BuildContext context,
    NewEventFormState formState,
  ) {
    return TextFormField(
      controller: _eventDateController,
      readOnly: true,
      decoration: const InputDecoration(
        label: Text('Date*'),
        prefixIcon: Icon(Icons.event),
        helperText: '',
      ),
      onTap: () async {
        DateTime? eventDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 100),
        );

        if (eventDate != null) {
          _eventDateController.text = DateFormat.yMd().format(eventDate);

          formState.eventDate = eventDate;
        }
      },
      validator: (String? value) {
        return stringValidator(value, 'Date');
      },
    );
  }

  /// Builds a [TextFormField] that shows a [TimePickerDialog] on tap.
  TextFormField _buildTimePicker(
      BuildContext context, NewEventFormState formState) {
    return TextFormField(
      controller: _eventTimeController,
      readOnly: true,
      decoration: const InputDecoration(
        label: Text('Time*'),
        prefixIcon: Icon(Icons.schedule),
        helperText: '',
      ),
      onTap: () async {
        TimeOfDay? eventTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (eventTime != null) {
          _eventTimeController.text =
              "${eventTime.hourOfPeriod}:${eventTime.minute} ${eventTime.period == DayPeriod.am ? 'AM' : 'PM'}";

          formState.eventTime = eventTime;
        }
      },
      validator: (String? value) {
        return stringValidator(value, 'Time');
      },
    );
  }

  /// Dispose of [TextEditingController]s.
  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDescriptionController.dispose();
    _eventDateController.dispose();
    _eventTimeController.dispose();
    super.dispose();
  }
}
