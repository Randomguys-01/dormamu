import 'package:dormamu/src/events/widgets/event_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/event.dart';
import 'models/event_list_state.dart';

class EventsDestination extends StatelessWidget {
  const EventsDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: ChangeNotifierProvider(
        create: (_) => EventListState(),
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
      ),
    );
  }
}
