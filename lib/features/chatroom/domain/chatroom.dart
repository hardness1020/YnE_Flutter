import 'package:firebase_auth/firebase_auth.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

class ChatRoom {
  String? id;
  bool? heroRead;
  User? chatPartner;
  List<Message?>? messages; // reversed sort in time

  ChatRoom({this.id, this.heroRead, this.chatPartner});
}
