import 'package:dormamu/src/messaging/models/conversation.dart';
import 'package:flutter/material.dart';

import 'conversation_tile.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    Key? key,
    required List<Conversation> conversations,
  })  : _conversations = conversations,
        super(key: key);

  final List<Conversation> _conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _conversations.length,
      itemBuilder: (_, int index) {
        final conversation = _conversations[index];

        return ConversationTile(
          key: ValueKey(conversation.conversationId),
          conversation: conversation,
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
