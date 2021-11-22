import 'package:dormamu/src/messaging/screens/new_conversation/models/contact.dart';
import 'package:dormamu/src/messaging/screens/new_conversation/models/contact_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme.dart' as theme;

/// A [ListTile] that represents a [Contact].
///
/// A custom implementation of a [ListTile] displays basic info about a user
/// that the current user can contact.
class ContactTile extends StatelessWidget {
  /// Default constructor requires all fields
  const ContactTile({
    Key? key,
    required this.contact,
    required this.selected,
  }) : super(key: key);

  /// The [Contact] this [ContactTile] represents.
  final Contact contact;

  /// Stores if this [ContactTile] is in the selected state.
  ///
  /// If true, the leading icon is [Icons.check] and the background color
  /// changes to [theme.primaryColor].
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: theme.primaryColor.withOpacity(!selected ? 0 : 0.2),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: !selected ? theme.secondaryColor : theme.primaryColor,
          ),
          child: Center(
            child: !selected
                ? _buildInitials(contact.initials)
                : const Icon(Icons.check, color: Colors.white),
          ),
        ),
        title: Text(contact.name),
        subtitle: Text(contact.email),
        trailing: Text(contact.floor),
        onTap: () {
          Provider.of<ContactListState>(context, listen: false)
              .toggleSelected(contact.uuid);
        },
      ),
    );
  }

  /// Builds [Text] to display contacts initials.
  Widget _buildInitials(String initials) {
    return Text(
      initials,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
