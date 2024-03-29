import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/chatroom/data/interface/intf_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';
import 'package:yne_flutter/utils/delay.dart';

class ChatroomService {
  final Ref ref;

  ChatroomService(this.ref);

  Tuple2<String, List<ChatRoom>?> getList(String page) {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    final pageAndChatroomList = chatroomRepo.getList(page: page);
    return pageAndChatroomList;
  }

  ChatRoom? get(String chatroomID) {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    return chatroomRepo.get(chatroomID: chatroomID);
  }

  Future<Tuple2<String, List<ChatRoom>?>> fetchList(String page) async {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    final pageAndChatroomList = await chatroomRepo.fetchList(page: page);
    return pageAndChatroomList;
  }

  Future<ChatRoom?> fetch(String chatroomID) async {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    final chatroom = await chatroomRepo.fetch(chatroomID: chatroomID);
    return chatroom;
  }

  Future<ChatRoom?> userReadChatroom(String chatroomID) async {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    final chatroom =
        await chatroomRepo.userReadChatRoom(chatroomID: chatroomID);
    chatroomRepo.set(chatroom: chatroom!);
    return chatroom;
  }

  Future<void> userSendMessage(
      {required String chatroomID,
      required String uuid,
      required String content}) async {
    final IntfChatroomRepo chatroomRepo = ref.watch(chatroomRepoProvider);
    final message = await chatroomRepo.userSendMessage(
        chatroomID: chatroomID, uuid: uuid, content: content);
    await delay(true, 3000);
    chatroomRepo.receiveAndSetSentMessage(
        chatroomID: chatroomID, message: message!);
  }
}

final chatroomServiceProvider = Provider<ChatroomService>((ref) {
  final chatroomService = ChatroomService(ref);
  return chatroomService;
});

final chatroomProvider = Provider.family<ChatRoom?, String>((ref, id) {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return chatroomService.get(id);
});

final chatroomListProvider =
    Provider.family<Tuple2<String, List<ChatRoom>?>, String>((ref, page) {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return chatroomService.getList(page);
});

final chatroomFutureProvider =
    FutureProvider.autoDispose.family<ChatRoom?, String>((ref, id) async {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return await chatroomService.fetch(id);
});

final chatroomListFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<ChatRoom>?>, String>((ref, page) async {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return await chatroomService.fetchList(page);
});

final userReadChatroomProvider = FutureProvider.autoDispose
    .family<ChatRoom?, String>((ref, chatroomID) async {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return await chatroomService.userReadChatroom(chatroomID);
});

final userSendMessageProvider = FutureProvider.autoDispose
    .family<void, Tuple3<String, String, String>>(
        (ref, chatroomIDandUUIDandContent) async {
  final chatroomService = ref.watch(chatroomServiceProvider);
  return await chatroomService.userSendMessage(
      chatroomID: chatroomIDandUUIDandContent.item1,
      uuid: chatroomIDandUUIDandContent.item2,
      content: chatroomIDandUUIDandContent.item3);
});
