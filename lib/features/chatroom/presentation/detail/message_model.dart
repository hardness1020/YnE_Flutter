class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hahahahahaha", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "I want to build a rocket!", messageType: "receiver"),
  ChatMessage(messageContent: "???????", messageType: "sender"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "QQ", messageType: "receiver"),
  ChatMessage(messageContent: "Well.....", messageType: "sender"),
  ChatMessage(messageContent: "Do you know FFT?", messageType: "sender"),
  ChatMessage(messageContent: "Good luck for you!", messageType: "sender"),
];
