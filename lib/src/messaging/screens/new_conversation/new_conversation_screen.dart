import 'package:dormamu/src/messaging/models/conversation.dart';
import 'package:dormamu/src/messaging/models/conversation_list_state.dart';
import 'package:dormamu/theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/contact_list_state.dart';

class NewConversationScreen extends StatelessWidget {
  const NewConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactListState(),
      child: Scaffold(
        appBar: AppBar(title: const Text('New Conversation')),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('TO'),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a name...',
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          label: const Text("Start Conversation"),
          backgroundColor: theme.primaryColor,
          onPressed: () {
            Provider.of<ConversationListState>(context, listen: false)
                .addConversation(
              Conversation(
                conversationId: 4,
                conversationType: ConversationType.direct,
                isRead: true,
                conversationName: 'New Conversation',
                messagePreview: '',
                lastTimestamp: DateTime.now(),
              ),
            );
            Provider.of<ContactListState>(context, listen: false)
                .clearSelected();
            Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
