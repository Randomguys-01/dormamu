import 'package:dormamu/src/events/events.dart';
import 'package:dormamu/src/screens/messaging.dart';
import 'package:dormamu/src/screens/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///Defines screens on navigation widgets.
///
/// Every Destination represents a screen the user can access through the
/// various navigation elements (NavigationBar, NavigationRail,
/// NavigationDrawer).
///
/// NOTE: The order destinations are defined controls the order they appear on
/// navigation elements.
///
/// Messaging - Provides the ability to view and send messages with other users.
/// Events - Provides the ability to view, create, and join public events.
/// Tools - Provides handy tools for dorm life (ex: Laundry Timer).
///
/// See Also:
///
/// * [MessagingDestination]
/// * [EventsDestination]
/// * [ToolsDestination]
enum Destination {
  messaging,
  events,
  tools,
}

///Extension on [Destination] defines properties related to Destinations.
///
/// Additional Properties:
/// * [name] - The destinations name (Used as a label on navigation elements).
/// * [icon] - The icon representing the destination label.
/// * [widget] - The destination's widget.
///
/// See Also:
/// * [Destination]
extension DestinationUtils on Destination {
  /// Defines the name of a [Destination].
  ///
  /// Formats and returns the name of the enum using [describeEnum].
  String get name {
    //TODO: only supports one word enums
    final String enumName = describeEnum(this);
    final String firstLetter = enumName[0].toUpperCase();
    return firstLetter + enumName.substring(1);
  }

  /// Defines the icon representing a [Destination].
  ///
  /// returns and [Icon] instance representing a [Destination].
  IconData get icon {
    switch (this) {
      case Destination.messaging:
        return Icons.forum;
      case Destination.events:
        return Icons.event;
      case Destination.tools:
        return Icons.handyman;
    }
  }

  ///Defines the widget this instance of a [Destination] is related to.
  ///
  /// returns the actual widget associated with this [Destination].
  Widget get widget {
    switch (this) {
      case Destination.messaging:
        return const MessagingDestination();
      case Destination.events:
        return const EventsDestination();
      case Destination.tools:
        return const ToolsDestination();
    }
  }
}
