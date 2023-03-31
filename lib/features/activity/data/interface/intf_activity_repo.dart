import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_repo.dart';

abstract class IntfActivityRepo {
  Stream<List<Activity>?> watchList();

  Stream<Activity?> watch({required String activityID});

  List<Activity>? getList();

  Activity? get({required String activityID});

  void setList({required List<Activity> activityList});

  void set({required Activity activity});

  void unset({required String activityID});

  Future<List<Activity>?> fetchList({required String page});

  Future<Activity?> fetch({required String activityID});

  Future<Activity?> create(
      {required Activity activity, required String userID});

  Future<Activity?> update(
      {required Activity activity, required String userID});

  Future<void> delete({required String activityID, required String userID});

  // // check if user has liked the activity
  // Future<bool> userHasLikedActivity(
  //     {required String activityID, required String userID});

  // // check if user has joined the activity
  // Future<bool> userHasJoinedActivity(
  //     {required String activityID, required String userID});

  Future<Activity> userLikeActivity(
      {required String activityID, required String userID});

  Future<Activity> userUnlikeActivity(
      {required String activityID, required String userID});

  Future<Activity> userToggleLikeActivity({
    required String activityID,
    required String userID,
  });

  Future<Activity> userJoinActivity(
      {required String activityID, required String userID});

  Future<Activity> userUnjoinActivity(
      {required String activityID, required String userID});

  Future<Activity> userToggleJoinActivity({
    required String activityID,
    required String userID,
  });

  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID});

  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID});
}

final activityRepoProvider = Provider<IntfActivityRepo>((ref) {
  final activityRepo =
      kUseFakeRepos ? FakeActivityRepo() : DjangoActivityRepo();
  return activityRepo;
});

final activityListStreamProvider =
    StreamProvider.autoDispose<List<Activity>?>((ref) {
  final activityListRepo = ref.watch(activityRepoProvider);
  return activityListRepo.watchList();
});

final activityStreamProvider =
    StreamProvider.autoDispose.family<Activity?, String>((ref, id) {
  final activityListRepo = ref.watch(activityRepoProvider);
  return activityListRepo.watch(activityID: id);
});
