import 'package:flutter/material.dart';

/// Custom [AppBar] displays the name of the conversation and a back button to
/// close the conversation.
class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// Default constructor initializes [_conversationName].
  const ConversationAppBar({
    Key? key,
    required String conversationName,
  })  : _conversationName = conversationName,
        super(key: key);

  /// The name of the conversation being displayed is used as the title of the
  /// AppBar.
  final String _conversationName;

  @override
  Widget build(BuildContext context) {
    // Basic AppBar uses the conversation name as the title
    return AppBar(
      title: Text(_conversationName),
    );
  }

  /// Uses the default [kToolbarHeight] for the preferred size of the [AppBar].
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
