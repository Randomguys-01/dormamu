/// Defines the direction a [Message] a message was sent.
///
/// The message can either be:
///
/// * [sent] - The user sent this message to recipients.
/// * [received] - The message was sent to the user by another user.
enum MessageDirection { sent, received }

/// Represents a message that can be sent in a [Conversation].
class Message {

  /// The text message either sent or received.
  final String body;

  /// The [DateTime] the message was sent.
  final DateTime timestamp;

  /// Stores if the message was sent or received.
  final MessageDirection direction;

  /// Default constructor requires all paramenters.
  const Message({
    required this.body,
    required this.timestamp,
    required this.direction,
  });
}
