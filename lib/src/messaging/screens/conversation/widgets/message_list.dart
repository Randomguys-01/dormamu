import 'package:dormamu/src/messaging/screens/conversation/models/message.dart';
import 'package:flutter/material.dart';

import '../../../../../theme.dart' as theme;

/// Displays a [ListView] of [Message]s in a [Conversation].
class MessageList extends StatelessWidget {
  MessageList({
    Key? key,
    required List<Message> messages,
  })  : _messages = messages
          ..sort((Message message1, Message message2) {
            return message2.timestamp.compareTo(message1.timestamp);
          }),
        super(key: key);

  /// Store list  of messages to display in [ListView].
  final List<Message> _messages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      padding: const EdgeInsets.all(8),
      itemCount: _messages.length,
      itemBuilder: (_, int index) {
        final message = _messages[index];

        return Align(
          alignment: message.direction == MessageDirection.sent
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: message.direction == MessageDirection.sent
                  ? theme.primaryColor
                  : theme.secondaryColor,
            ),
            child: Text(
              message.body,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}
