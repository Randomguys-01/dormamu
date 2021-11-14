import 'package:dormamu/src/messaging/widgets/messaging_tab.dart';
import 'package:dormamu/src/messaging/widgets/new_conversation_fab.dart';
import 'package:flutter/material.dart';

import 'models/conversation.dart';

class MessagingDestination extends StatelessWidget {
  const MessagingDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messaging'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'COMMUNITY'),
              Tab(text: 'DIRECT'),
              Tab(text: 'GROUP'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MessagingTab(conversationType: ConversationType.community),
            MessagingTab(conversationType: ConversationType.direct),
            MessagingTab(conversationType: ConversationType.group),
          ],
        ),
        floatingActionButton: const NewConversationFAB(),
      ),
    );
  }
}
