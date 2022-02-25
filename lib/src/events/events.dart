import 'package:dormamu/src/events/pages/new_event/new_event_screen.dart';
import 'package:dormamu/src/events/widgets/event_tab.dart';
import 'package:dormamu/src/utils/decoration/pillow_shape.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/event.dart';
import 'models/event_list_state.dart';

class EventsDestination extends StatelessWidget {
  const EventsDestination({Key? key}) : super(key: key);

  @override
  Widget build(_) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: ChangeNotifierProvider(
          create: (_) => EventListState(),
          builder: (context, _) {
            return Scaffold(
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
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                shape: PillowShape(),
                onPressed: () {
                  final eventListState =
                      Provider.of<EventListState>(context, listen: false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            NewEventScreen(eventListState: eventListState),
                      ));
                },
              ),
            );
          }),
    );
  }
}
