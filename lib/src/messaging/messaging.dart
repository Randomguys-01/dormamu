import 'package:dormamu/src/messaging/models/conversation_list_state.dart';
import 'package:dormamu/src/messaging/widgets/messaging_tab.dart';
import 'package:dormamu/src/messaging/widgets/new_conversation_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/conversation.dart';

class MessagingDestination extends StatelessWidget {
  const MessagingDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: ChangeNotifierProvider(
        create: (_) => ConversationListState(),
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
      ),
    );
  }
}
