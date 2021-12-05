import 'package:flutter/cupertino.dart';

import '../utils/destination.dart';

/// Maintains the navigational state of the app.
///
/// Stores the current [Destination] of the app - [_currentDestination].
/// Provides getters and setters to read/update the current [Destination] of the
/// app. Holds a callback that can be used to update the current [Destination]
/// of the app given an index.
///
/// This is a [ChangeNotifier], when the current [Destination] is changed, all
/// consumers listening to this will update and change their content to reflect
/// the changes.
///
/// See also:
///
/// * [Destination] - Defines the available destinations.
/// * [ChangeNotifier] - Parent class.
class NavigationState extends ChangeNotifier {
  ///Holds the [_currentDestination] of the app.
  Destination _currentDestination = Destination.messaging;

  ///Returns the [_currentDestination] of the app.
  Destination get currentDestination => _currentDestination;

  ///Sets a new [_currentDestination] and notifies listeners of the change.
  set currentDestination(Destination newDestination) {
    _currentDestination = newDestination;

    notifyListeners();
  }

  ///Callback changes the [_currentDestination] given a numeric index.
  void onDestinationSelected(int? index) {
    if (index == null) return;

    if (index < 0 || index > 2) throw ArgumentError("Invalid index: $index");

    currentDestination = Destination.values[index];
  }
}
