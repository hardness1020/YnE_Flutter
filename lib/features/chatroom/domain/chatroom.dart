import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

class ChatRoom {
  String? id;
  bool? heroRead;
  BackendUser? chatPartner;
  List<Message?>? messages; // reversed sort in time

  ChatRoom({this.id, this.heroRead, this.chatPartner, this.messages});
}
