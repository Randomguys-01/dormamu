import 'package:flutter/material.dart';

import 'conversation.dart';

class ConversationListState extends ChangeNotifier {
  final List<Conversation> _conversations = <Conversation>[

  ];

  void addConversation(Conversation conversation) {
    _conversations.add(conversation);

    notifyListeners();
  }

  List<Conversation> getConversationByType(ConversationType conversationType) {
    return _conversations.where((Conversation conversation) {
      return conversation.conversationType == conversationType;
    }).toList();
  }
}
