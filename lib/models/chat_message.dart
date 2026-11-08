enum ChatRole { user, assistant }

class ChatMessage {
  final ChatRole role;
  final String text;

  const ChatMessage({required this.role, required this.text});

  bool get isUser => role == ChatRole.user;
}
