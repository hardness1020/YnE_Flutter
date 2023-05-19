import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/chatroom/data/interface/intf_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

class DjangoChatroomRepo extends IntfChatroomRepo {
  @override
  Stream<ChatRoom?> watch({required String chatroomID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<ChatRoom>?> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }

  @override
  Stream<Message> watchSentMessage({required String chatroomID}) {
    // TODO: implement watchSentMessage
    throw UnimplementedError();
  }

  @override
  void handleReceivedMessage({required Message message}) {
    // TODO: implement handleReceivedMessage
    throw UnimplementedError();
  }

  @override
  Future<ChatRoom?> fetch({required String chatroomID}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<ChatRoom>?>> fetchList({required String page}) {
    // TODO: implement fetchList
    throw UnimplementedError();
  }

  @override
  ChatRoom? get({required String chatroomID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Tuple2<String, List<ChatRoom>?> getList({required String page}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  void set({required ChatRoom chatroom}) {
    // TODO: implement set
  }

  @override
  void setList({required List<ChatRoom> chatroomList}) {
    // TODO: implement setList
  }

  @override
  void unset({required String chatroomID}) {
    // TODO: implement unset
  }

  @override
  Future<ChatRoom?> userReadChatRoom({required String chatroomID}) {
    // TODO: implement userReadChatRoom
    throw UnimplementedError();
  }

  @override
  Future<Message?> userSendMessage(
      {required String chatroomID,
      required String uuid,
      required String content}) {
    // TODO: implement userSendMessage
    throw UnimplementedError();
  }

  @override
  void receiveAndSetSentMessage(
      {required String chatroomID, required Message message}) {
    // TODO: implement setMessage
  }
}
