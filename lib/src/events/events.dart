import 'package:dormamu/src/events/widgets/events_tab.dart';
import 'package:flutter/material.dart';

import 'models/event.dart';

class EventsDestination extends StatelessWidget {
  const EventsDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Community'),
              Tab(text: 'Private'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EventTab(eventType: EventType.community),
            EventTab(eventType: EventType.private),
          ],
        ),
      ),
    );
  }
}
