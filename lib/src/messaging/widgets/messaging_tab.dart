import 'package:dormamu/src/messaging/models/conversation.dart';
import 'package:dormamu/src/messaging/models/conversation_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ConversationListState>(builder: (_, listState, __) {
      return MessageList(
        conversations: listState.getConversationByType(_conversationType),
      );
    });
  }
}
