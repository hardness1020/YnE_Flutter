import 'package:tuple/tuple.dart';
import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/chatroom/data/interface/intf_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/utils/delay.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeChatroomRepo extends IntfChatroomRepo {
  final InMemoryStore<List<ChatRoom>> _chatrooms =
      InMemoryStore<List<ChatRoom>>(List.from(fakeChatroomList));

  final bool addDelay;

  FakeChatroomRepo({this.addDelay = true});

  @override
  Stream<ChatRoom?> watch({required String chatroomID}) {
    try {
      return watchList().map((chatroomList) =>
          _get(chatroomList: chatroomList, chatroomID: chatroomID));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<ChatRoom>?> watchList() {
    try {
      return _chatrooms.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  ChatRoom? get({required String chatroomID}) {
    try {
      return _get(chatroomList: _chatrooms.value, chatroomID: chatroomID);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Tuple2<String, List<ChatRoom>?> getList({required String page}) {
    try {
      // TODO: implement pagenation
      return Tuple2<String, List<ChatRoom>?>(page, _chatrooms.value.toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  void set({required ChatRoom chatroom}) {
    try {
      final chatroomList = _chatrooms.value;
      for (int i = 0; i < chatroomList.length; i++) {
        if (chatroomList[i].id == chatroom.id) {
          chatroomList[i] = chatroom;
          break;
        } else {
          chatroomList.add(chatroom);
        }
      }
      _chatrooms.value = chatroomList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setList({required List<ChatRoom> chatroomList}) {
    try {
      _chatrooms.value = chatroomList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void unset({required String chatroomID}) {
    try {
      final chatroomList = _chatrooms.value;
      for (int i = 0; i < chatroomList.length; i++) {
        if (chatroomList[i].id == chatroomID) {
          chatroomList.removeAt(i);
          break;
        }
      }
      _chatrooms.value = chatroomList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChatRoom?> fetch({required String chatroomID}) async {
    try {
      await delay(addDelay);
      final futureFakeChatroomList = Future.value(fakeChatroomList);
      final fetchedFakeChatroomList = await futureFakeChatroomList;
      for (int i = 0; i < fetchedFakeChatroomList.length; i++) {
        if (fetchedFakeChatroomList[i].id == chatroomID) {
          return fetchedFakeChatroomList[i];
        }
      }
      throw Exception('Chatroom not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<String, List<ChatRoom>?>> fetchList(
      {required String page}) async {
    // TODO: implement pagenation
    try {
      await delay(addDelay);
      final futureFakeChatroomList = Future.value(fakeChatroomList);
      final fetchedFakeChatroomList = await futureFakeChatroomList;
      return Tuple2<String, List<ChatRoom>?>(page, fetchedFakeChatroomList);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChatRoom?> userReadChatRoom({required String chatroomID}) async {
    try {
      await delay(addDelay);
      final List<ChatRoom> chatroomList = _chatrooms.value;
      final int index = chatroomList.indexWhere((p) => p.id == chatroomID);
      if (index == -1) {
        throw Exception('Chatroom not found');
      } else {
        chatroomList[index].heroRead = true;
      }
      _chatrooms.value = chatroomList;
      return _chatrooms.value[index];
    } catch (e) {
      rethrow;
    }
  }

  static ChatRoom? _get(
      {required List<ChatRoom>? chatroomList, required String chatroomID}) {
    try {
      return chatroomList!.firstWhere((chatroom) => chatroom.id == chatroomID);
    } catch (e) {
      rethrow;
    }
  }
}
