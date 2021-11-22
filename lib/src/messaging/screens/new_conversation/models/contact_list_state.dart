import 'package:flutter/material.dart';

/// Holds state information for the [ContactList].
class ContactListState extends ChangeNotifier {
  /// Stores the selected state of each contact as a [Map].
  ///
  /// Key: [int] uuid of each [Contact].
  /// Value: [bool] if the [Contact] is selected.
  final Map<int, bool> _selectedContacts = <int, bool>{};

  /// returns true if the [Contact] is selected.
  bool isSelected(int uuid) {
    return _selectedContacts[uuid] ?? false;
  }

  /// Toggles the selected state of a [Contact].
  /// true => false
  /// false => true
  void toggleSelected(int uuid) {
    _selectedContacts[uuid] = !(_selectedContacts[uuid] ?? false);

    notifyListeners();
  }

  /// Clears all contact states.
  void clearSelected() {
    _selectedContacts.clear();

    notifyListeners();
  }
}
