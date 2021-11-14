import 'package:dormamu/src/messaging/screens/new_conversation/new_conversation_screen.dart';
import 'package:flutter/material.dart';

class NewConversationFAB extends StatelessWidget {
  const NewConversationFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const NewConversationScreen(),
          ),
        );
      },
    );
  }
}
