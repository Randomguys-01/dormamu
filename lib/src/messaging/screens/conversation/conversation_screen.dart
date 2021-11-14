import 'package:dormamu/src/messaging/screens/conversation/widgets/app_bar.dart';
import 'package:dormamu/src/messaging/screens/conversation/widgets/message_list.dart';
import 'package:flutter/material.dart';

import 'models/message.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({
    Key? key,
    required int conversationId,
  })  : _conversationId = conversationId,
        super(key: key);

  final int _conversationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConversationAppBar(conversationName: 'Ian White'),
      body: Column(
        children: <Widget>[
          Expanded(
              child: MessageList(
            messages: [
              Message(
                body: 'Hello World!',
                timestamp: DateTime(2021, 11, 13),
                direction: MessageDirection.sent,
              ),
              Message(
                body: 'uh...hi',
                timestamp: DateTime.now(),
                direction: MessageDirection.received,
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter a message...',
                suffixIcon: const Icon(Icons.send),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
