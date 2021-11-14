import 'package:dormamu/src/messaging/models/conversation.dart';
import 'package:flutter/material.dart';

import 'message_list.dart';

class MessagingTab extends StatelessWidget {
  const MessagingTab({
    Key? key,
    required ConversationType conversationType,
  })  : _conversationType = conversationType,
        super(key: key);

  final ConversationType _conversationType;

  @override
  Widget build(BuildContext context) {
    return MessageList(
      conversations: <Conversation>[

      ].where((Conversation conversation) {
        return conversation.conversationType == _conversationType;
      }).toList(),
    );
  }
}
