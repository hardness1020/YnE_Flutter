import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/chatroom/data/django/jg_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/data/fake/fake_chatroom_repo.dart';
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

final chatroomRepoProvider = Provider<IntfChatroomRepo>((ref) {
  final chatroomRepo =
      kUseFakeRepos ? FakeChatroomRepo() : DjangoChatroomRepo();
  return chatroomRepo;
});

final chatroomListStreamProvider =
    StreamProvider.autoDispose<List<ChatRoom>?>((ref) {
  final chatroomRepo = ref.watch(chatroomRepoProvider);
  return chatroomRepo.watchList();
});

final chatroomStreamProvider =
    StreamProvider.autoDispose.family<ChatRoom?, String>((ref, chatroomID) {
  final chatroomRepo = ref.watch(chatroomRepoProvider);
  return chatroomRepo.watch(chatroomID: chatroomID);
});
