import 'package:flutter/foundation.dart';
import '../models/chat_message.dart';
import '../services/gemini_service.dart';

class ChatViewModel extends ChangeNotifier {
  final GeminiService _service;
  ChatViewModel(this._service);

  final List<ChatMessage> _messages = [
    const ChatMessage(
      role: ChatRole.assistant,
      text:
          'Olá! Sou o assistente do Conecta Mente. Como você está se sentindo hoje?',
    ),
  ];
  bool _sending = false;

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get sending => _sending;

  Future<void> send(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _sending) return;

    _messages.add(ChatMessage(role: ChatRole.user, text: trimmed));
    _sending = true;
    notifyListeners();

    final reply = await _service.sendMessage(trimmed);
    _messages.add(ChatMessage(role: ChatRole.assistant, text: reply));
    _sending = false;
    notifyListeners();
  }
}
