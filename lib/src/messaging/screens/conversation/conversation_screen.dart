import 'package:dormamu/src/messaging/screens/conversation/widgets/message_list.dart';
import 'package:flutter/material.dart';

import 'models/message.dart';

/// [ConversationScreen] display all messages in a conversation and has a
/// [TextField] for sending new messages.
///
/// Displays a list of messages using [MessageList].
class ConversationScreen extends StatefulWidget {
  const ConversationScreen({
    Key? key,
    required int conversationId,
  })  : _conversationId = conversationId,
        super(key: key);

  final int _conversationId;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

/// State class builds [ConversationScreen].
class _ConversationScreenState extends State<ConversationScreen> {
  /// [TextEditingController] watches message [TextField] to get the user's
  /// message and clear after the message is sent.
  late final TextEditingController _messageController;

  final List<Message> _messages = <Message>[
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
  ];

  /// Creates [TextEditingController]s.
  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ian White')),
      body: Column(
        children: <Widget>[
          Expanded(
              child: MessageList(
            messages: _messages,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Enter a message...',
                suffix: _buildSendButton(),
                filled: true,
                fillColor: Colors.grey[300],
              ),
              onSubmitted: (String value) {
                if (_messageController.text.isEmpty) return;
                _sendMessage(Message(
                  body: value,
                  timestamp: DateTime.now(),
                  direction: MessageDirection.sent,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Disposes of [TextEditingController]s to avoid memory leaks.
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }


  /// Creates a send button for users (primarily mobile) to send a message.
  ///
  /// Icon: [Icons.send]
  Widget _buildSendButton() {
    return IconButton(
      icon: const Icon(
        Icons.send,
      ),
      onPressed: () {
        if (_messageController.text.isEmpty) return;
        _sendMessage(Message(
          body: _messageController.text,
          timestamp: DateTime.now(),
          direction: MessageDirection.sent,
        ));
      },
    );
  }

  //TODO: update documentation here; currently only stored while app running
  void _sendMessage(Message message) {
    setState(() {
      _messages.add(message);
      _messageController.clear();
    });
  }
}
