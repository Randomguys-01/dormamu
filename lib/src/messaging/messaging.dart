import 'package:flutter/material.dart';

import 'tabs/_tabs.dart';

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
            CommunityMessaging(),
            DirectMessaging(),
            GroupMessaging(),
          ],
        ),
      ),
    );
  }
}
