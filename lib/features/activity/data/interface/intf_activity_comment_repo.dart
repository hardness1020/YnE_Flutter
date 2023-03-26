import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_comment_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_comment_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';

abstract class IntfActivityCommentRepo {
  List<ActivityComment> getList();

  ActivityComment? get({required String activityCommentID});

  Future<void> setList({required List<ActivityComment> activityCommentList});

  Future<void> set({required ActivityComment activityComment});

  Future<ActivityComment?> fetch({required String activityCommentID});

  Future<List<ActivityComment>> fetchList(); //async

  Stream<List<ActivityComment>> watchList();

  Stream<ActivityComment?> watch({required String activityCommentID});

  Future<ActivityComment> create({required ActivityComment activityComment});

  Future<ActivityComment> update({required ActivityComment activityComment});

  Future<void> delete({required String activityCommentID});

  Future<Tuple2<String, List<ActivityComment>>> fetchByActivity(
      {required String page, required String activityCommentID});
}

final activityCommentRepoProvider = Provider<IntfActivityCommentRepo>((ref) {
  final activityCommentRepo =
      kUseFakeRepos ? FakeActivityCommentRepo() : DjangoActivityCommentRepo();
  return activityCommentRepo;
});

// final activityCommentProvider =
//     Provider.family<ActivityComment?, String>((ref, id) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.get(activityCommentID: id);
// });

// final activityCommentFutureProvider =
//     FutureProvider.family<ActivityComment?, String>((ref, id) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.fetch(activityCommentID: id);
// });

// final activityCommentStreamProvider =
//     StreamProvider.family<ActivityComment?, String>((ref, id) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.watch(activityCommentID: id);
// });

// final activityCommentListProvider = Provider<List<ActivityComment>>((ref) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.getList();
// });

// final activityCommentListFutureProvider =
//     FutureProvider.autoDispose<List<ActivityComment>>((ref) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.fetchList();
// });

// final activityCommentListStreamProvider =
//     StreamProvider.autoDispose<List<ActivityComment>>((ref) {
//   final activityCommentListRepo = ref.watch(activityCommentRepoProvider);
//   return activityCommentListRepo.watchList();
// });
