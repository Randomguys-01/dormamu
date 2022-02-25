import 'package:dormamu/src/utils/common/_common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/event.dart';

/// [Scaffold.body] of [EventDetailsPage]. Displays details about an [Event].
class EventDetailsBody extends StatelessWidget {
  /// Default constructor.
  ///
  /// Parameters:
  ///   * [event] - The [Event] this screen is displaying details about.
  const EventDetailsBody({
    Key? key,
    required Event event,
  })  : _event = event,
        super(key: key);

  /// The [Event] this screen is displaying details about. Used to populate the
  /// fields.
  final Event _event;

  @override
  Widget build(BuildContext context) {
    // 8 px around border
    return Padding(
      padding: const EdgeInsets.all(8.0),

      // Top to bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Event description
          _buildFieldLabel(context, label: "Description"),
          _buildFieldValue(context, value: _event.description),
          const SizedBox(height: 8),

          // Event date
          _buildFieldLabel(context, label: "Date"),
          _buildFieldValue(
            context,
            value: DateFormat(kFormalDateTime).format(_event.startDate),
          ),
          const SizedBox(height: 8),

          // Event location
          _buildFieldLabel(context, label: "Location"),
          _buildFieldValue(context, value: _event.location),
          const SizedBox(height: 8),

          // Event organizer
          _buildFieldLabel(context, label: "Organizer"),
          _buildFieldValue(context, value: _event.organizer),
        ],
      ),
    );
  }

  /// Builds a [Text] with value [label]. [context] used to lookup [TextTheme].
  ///
  /// TextStyle: [TextTheme.subtitle2].
  Widget _buildFieldLabel(BuildContext context, {required String label}) {
    return Text(
      label,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  /// Builds a [Text] with value [value]. [context] used to lookup [TextTheme].
  ///
  /// TextStyle: [TextTheme.subtitle2].
  Widget _buildFieldValue(BuildContext context, {required String value}) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
