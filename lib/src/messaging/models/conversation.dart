/// Defines the types of conversations users can have.
///
/// There are 3 types of conversations user can have:
///
/// * [community] - Community conversations are one way conversations users are
/// automatically placed in. Example [community] conversations are floor chats.
/// Only authorized users may send messages in this chat.
///
/// * [direct] - Direct conversations are between two users. They operate the
/// same as any other messaging platform.
///
/// * [group] - Group conversations are between more than 2 users. Users may
/// be added or removed by admins, and can leave if they choose to.
enum ConversationType { community, direct, group }

/// Represents a conversation between users.
///
/// This object stores basic information needed to display a conversation that
/// the user is a part of.
class Conversation {
  /// The id used to identify this conversation.
  final int conversationId;

  /// The type of conversation. See [ConversationType].
  final ConversationType conversationType;

  /// True if the latest message has been read by the user.
  final bool isRead;

  /// The name of the conversation.
  ///
  /// * For Community conversations this is the name set by the admins.
  /// * For Direct conversations this is the name of the recipient.
  /// * For Group conversations this is the name of the recipients or the name
  /// set by the owner of the chat.
  final String conversationName;

  /// A preview of the most recent message.
  final String messagePreview;

  /// The [DateTime] of the last sent message.
  final DateTime lastTimestamp;

  /// Default constructor requires all parameters.
  Conversation({
    required this.conversationId,
    required this.conversationType,
    required this.isRead,
    required this.conversationName,
    required this.messagePreview,
    required this.lastTimestamp,
  });

  /// Returns a one or two letter initials for the name of the conversation.
  String get initials {
    final nameParts = conversationName.split(' ');

    assert(nameParts.isNotEmpty);
    if (nameParts.length == 1) {
      return nameParts[0][0];
    } else {
      return nameParts[0][0] + nameParts[1][0];
    }
  }
}
