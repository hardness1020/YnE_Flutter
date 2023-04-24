import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';

abstract class IntfChatroomRepo {
  Stream<List<ChatRoom>?> watchList();

  Stream<ChatRoom?> watch({required String chatroomID});

  List<ChatRoom>? getList();

  ChatRoom? get({required String chatroomID});

  void setList({required List<ChatRoom> chatroomList});

  void set({required ChatRoom chatroomList});

  void unset({required String chatroomID});

  Future<List<ChatRoom>?> fetchList({required String page});

  Future<ChatRoom?> fetch({required String chatroomID});

  Future<ChatRoom?> userReadChatRoom({required String chatroomID});
}
