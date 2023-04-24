import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

class ChatroomService {
  final Ref ref;

  ChatroomService(this.ref);

  List<ChatRoom>? getList(String page) {
    throw UnimplementedError();
  }

  ChatRoom? get(String chatroomID) {
    throw UnimplementedError();
  }

  Future<List<ChatRoom>?> fetchList(String page) async {
    // return the last message
    throw UnimplementedError();
  }

  Future<ChatRoom?> fetch(String chatroomID) async {
    throw UnimplementedError();
  }

  Future<ChatRoom?> userReadChatroom(String chatroomID) async{
    // 
    throw UnimplementedError();
  }

}
