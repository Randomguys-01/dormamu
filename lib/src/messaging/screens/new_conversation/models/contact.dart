/// Represents other users the current user can start a conversation with.
class Contact {
  /// unique id for each contact (user)
  final int uuid;

  /// The name of the contact.
  final String name;

  /// The university/college email of that user.
  final String email;

  /// The floor the user lives on
  final String floor;

  /// Default constructor requires all parameters.
  Contact({
    required this.uuid,
    required this.name,
    required this.email,
    required this.floor,
  });

  /// Returns a one or two letter initials for the name of the user.
  String get initials {
    final nameParts = name.split(' ');

    assert(nameParts.isNotEmpty);
    if (nameParts.length == 1) {
      return nameParts[0][0];
    } else {
      return nameParts[0][0] + nameParts[1][0];
    }
  }
}
