import 'package:dormamu/src/messaging/models/conversation_list_state.dart';
import 'package:dormamu/src/messaging/screens/new_conversation/new_conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewConversationFAB extends StatelessWidget {
  const NewConversationFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversationListState = Provider.of<ConversationListState>(context, listen: false);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: conversationListState,
              child: const NewConversationScreen(),
            ),
          ),
        );
      },
    );
  }
}
