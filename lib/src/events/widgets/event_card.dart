import 'package:dormamu/src/events/models/event.dart';
import 'package:flutter/material.dart';

/// UI representation of an [Event].
class EventCard extends StatelessWidget {
  /// Default constructor
  const EventCard({
    Key? key,
    required Event event,
  })  : _event = event,
        super(key: key);

  /// [Event] this [Card] represents.
  ///
  /// [Event] used to create [Card].
  final Event _event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/images/test/dormamu.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _event.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        _event.description,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    _event.likes.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
