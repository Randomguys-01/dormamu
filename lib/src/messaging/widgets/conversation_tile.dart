import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart' as theme;

/// Represents one conversation in any of the tabs.
///
/// Conversation uses a [ListTile] to show a group of messages between users. It
/// shows the recipient's initials and name. It also shows a preview of the most
/// recently sent message and the date of that message.
///
/// See Also:
///
/// * [ListTile] - This [Widget] customizes a ListTile.
class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key? key,
    required this.initials,
    required this.name,
    required this.messagePreview,
    required this.timeStamp,
  }) : super(key: key);

  final String initials;
  final String name;
  final String messagePreview;
  final DateTime timeStamp;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: theme.secondaryColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            initials,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(name),
      subtitle: Text(messagePreview),
      trailing: Text(formatDateTime(timeStamp)),
      onTap: () {},
    );
  }

  /// Formats a [DateTime] depending on it's distance relative to the current date
  ///
  /// [dateTime] is formatted by the following rules:
  /// * If the current day is the same as the timestamp: hour:minute period
  /// * If the current day is within 6 days of the timestamp: Weekday
  /// * If the current day is within 1 year of the timestamp: month day
  /// * If the current day is beyond 1 year of the timestamp: month/day/year
  String formatDateTime(DateTime dateTime) {
    final DateTime now = DateTime.now();

    if (now.day == dateTime.day) {
      return DateFormat.jm().format(dateTime);
    } else if (now.day - dateTime.day < 7) {
      return DateFormat('EEEE').format(dateTime);
    } else if (now.year == dateTime.year) {
      return DateFormat('LLL d').format(dateTime);
    } else {
      return DateFormat('M/d/y').format(dateTime);
    }
  }
//TODO: comment this and commit; fake data; fab(gotta figure out how to do animation when changing tabs, may need to use scaffold on every tab)
}
