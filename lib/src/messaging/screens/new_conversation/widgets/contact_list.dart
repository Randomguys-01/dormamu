import 'package:dormamu/src/messaging/screens/new_conversation/models/contact.dart';
import 'package:dormamu/src/messaging/screens/new_conversation/models/contact_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_tile.dart';

/// Custom [ListView] displays all [Contact]s that the current user can start a
/// conversation with.
class ContactList extends StatelessWidget {
  ContactList({
    Key? key,
    required List<Contact> contacts,
  })  : _contacts = contacts
          ..sort((contact1, contact2) {
            return contact1.name.compareTo(contact2.name);
          }),
        super(key: key);

  /// The [List] of [Contact]s being displayed.
  final List<Contact> _contacts;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactListState>(builder: (_, listState, __) {
      return ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (_, int index) {
            return ContactTile(
              contact: _contacts[index],
              selected: listState.isSelected(_contacts[index].uuid),
            );
          });
    });
  }
}
