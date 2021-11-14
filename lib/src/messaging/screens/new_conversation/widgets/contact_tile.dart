import 'package:dormamu/src/messaging/screens/new_conversation/models/contact.dart';
import 'package:flutter/material.dart';

import '../../../../../theme.dart' as theme;

/// A [ListTile] that represents a [Contact].
///
/// A custom implementation of a [ListTile] displays basic info about a user
/// that the current user can contact.
class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contact,
  }) : super(key: key);

  /// The [Contact] this [ContactTile] represents.
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: theme.secondaryColor,
        ),
        child: Center(
          child: Text(
            contact.initials,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.email),
      trailing: Text(contact.floor),
    );
  }
}
