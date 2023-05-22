import 'package:tuple/tuple.dart';
import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/backend_user/application/backend_user_service.dart';
import 'package:yne_flutter/features/chatroom/data/interface/intf_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';
import 'package:yne_flutter/utils/delay.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeChatroomRepo extends IntfChatroomRepo {
  final bool addDelay;
  late List<ChatRoom> lightweightChatroomList;

  FakeChatroomRepo({this.addDelay = true}) {
    lightweightChatroomList = <ChatRoom>[
      for (ChatRoom chatroom in fakeChatroomList)
        ChatRoom(
          id: chatroom.id,
          heroRead: chatroom.heroRead,
          chatPartner: chatroom.chatPartner,
          messages: null,
          lastMessage: chatroom.lastMessage,
        )
    ];
  }

  late final InMemoryStore<List<ChatRoom>> _lightChatrooms =
      InMemoryStore<List<ChatRoom>>(List.from(lightweightChatroomList));

  final Map<String, InMemoryStore<ChatRoom>> _chatroomMap = {
    for (ChatRoom chatroom in fakeChatroomList)
      chatroom.id!: InMemoryStore<ChatRoom>(chatroom)
  };

  final Map<String, InMemoryStore<Message>> _sentMessageStream = {
    for (ChatRoom chatroom in fakeChatroomList)
      chatroom.id!: InMemoryStore<Message>(Message())
  };

  @override
  Stream<ChatRoom?> watch({required String chatroomID}) {
    try {
      return _chatroomMap[chatroomID]!.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<ChatRoom>?> watchList() {
    try {
      return _lightChatrooms.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Message> watchSentMessage({required String chatroomID}) {
    try {
      return _sentMessageStream[chatroomID]!.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void handleReceivedMessage({required Message message}) {
    try {
      String messageChatroomID = message.chatroomID!;
      ChatRoom completeChatroom = _chatroomMap[messageChatroomID]!.value;
      completeChatroom.messages!.insert(0, message);
      completeChatroom.lastMessage = message;

      if (message.senderUserID == fakeHeroUser.id) {
        _sentMessageStream[messageChatroomID]!.value = message;
      }

      List<ChatRoom> chatroomList = _lightChatrooms.value;
      for (int i = 0; i < chatroomList.length; i++) {
        if (chatroomList[i].id == messageChatroomID) {
          chatroomList[i].lastMessage = message;
          break;
        }
      }
      _lightChatrooms.value = chatroomList;
      _chatroomMap[messageChatroomID]!.value = completeChatroom;
    } catch (e) {
      rethrow;
    }
  }

  @override
  ChatRoom? get({required String chatroomID}) {
    try {
      return _chatroomMap[chatroomID]!.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Tuple2<String, List<ChatRoom>?> getList({required String page}) {
    try {
      // TODO: implement pagenation
      return Tuple2<String, List<ChatRoom>?>(page, _lightChatrooms.value.toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  void receiveAndSetSentMessage(
      {required String chatroomID, required Message message}) {
    try {
      final List<ChatRoom> chatroomList = _lightChatrooms.value;
      final map = _chatroomMap;
      ChatRoom completeChatroom;
      final int index = chatroomList.indexWhere((p) => p.id == chatroomID);
      if (index == -1) {
        throw Exception('Chatroom not found');
      } else {
        completeChatroom = map[chatroomID]!.value;
        completeChatroom.messages!.insert(0, message);
        completeChatroom.lastMessage = message;
        chatroomList[index].lastMessage = message;
      }
      _chatroomMap[chatroomID]!.value = completeChatroom;
      _lightChatrooms.value = chatroomList;
      _sentMessageStream[chatroomID]!.value = message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void set({required ChatRoom chatroom}) {
    try {
      final chatroomList = _lightChatrooms.value;
      bool add = true;
      for (int i = 0; i < chatroomList.length; i++) {
        if (chatroomList[i].id == chatroom.id) {
          chatroomList[i] = chatroom;
          add = false;
          break;
        }
      }
      if (add == true) {
        chatroomList.insert(0, chatroom);
      }
      _chatroomMap[chatroom.id!]!.value = chatroom;
      _lightChatrooms.value = chatroomList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setList({required List<ChatRoom> chatroomList}) {
    try {
      _lightChatrooms.value = chatroomList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void unset({required String chatroomID}) {
    try {
      final chatroomList = _lightChatrooms.value;
      for (int i = 0; i < chatroomList.length; i++) {
        if (chatroomList[i].id == chatroomID) {
          chatroomList.removeAt(i);
          break;
        }
      }
      _lightChatrooms.value = chatroomList;
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
      final List<ChatRoom> chatroomList = _lightChatrooms.value;
      final map = _chatroomMap;
      ChatRoom completeChatroom;
      final int index = chatroomList.indexWhere((p) => p.id == chatroomID);
      if (index == -1) {
        throw Exception('Chatroom not found');
      } else {
        completeChatroom = map[chatroomID]!.value;
        completeChatroom.heroRead = true;
        chatroomList[index].heroRead = true;
      }
      _chatroomMap[chatroomID]!.value = completeChatroom;
      _lightChatrooms.value = chatroomList;

      return _chatroomMap[chatroomID]!.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Message?> userSendMessage(
      {required String chatroomID,
      required String uuid,
      required String content}) async {
    try {
      await delay(addDelay);
      DateTime now = DateTime.now();
      String convertedDateTime =
          "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
      final Message message = Message(
        uuid: uuid,
        senderUserID: fakeHeroUser.id,
        chatroomID: chatroomID,
        heroRead: true,
        content: content,
        time: convertedDateTime,
        type: 'sent',
      );
      return message;
    } catch (e) {
      rethrow;
    }
  }
}
