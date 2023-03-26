import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';

class ActivityService {
  final Ref ref;

  ActivityService(this.ref);

  List<Activity>? getList() {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return activityRepo.getList();
  }

  Activity? get({required String activityID}) {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return activityRepo.get(activityID: activityID);
  }

  Future<List<Activity>?> fetchList() async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.fetchList();
  }

  Future<Activity?> fetch({required String activityID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return activityRepo.fetch(activityID: activityID);
  }

  Future<void> create(
      {required Activity activity, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.create(activity: activity, userID: userID);
  }

  Future<void> update(
      {required Activity activity, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.update(activity: activity, userID: userID);
  }

  Future<void> delete(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.delete(activityID: activityID, userID: userID);
  }

  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.fetchListByCategory(
        page: page, activityCategoryID: activityCategoryID);
  }

  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.fetchListByLocation(
        page: page, activityLocationID: activityLocationID);
  }

  Future<void> activityLikedByUser(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.activityLikedByUser(
        activityID: activityID, userID: userID);
  }

  Future<void> activityUnlikedByUser(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.activityUnlikedByUser(
        activityID: activityID, userID: userID);
  }

  Future<void> activityJoinedByUser(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.activityJoinedByUser(
        activityID: activityID, userID: userID);
  }

  Future<void> activityUnjoinedByUser(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.activityUnjoinedByUser(
        activityID: activityID, userID: userID);
  }
}

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService(ref);
});

final activityListProvider = Provider<List<Activity>?>((ref) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.getList();
});

final activityProvider = Provider.family<Activity?, String>((ref, id) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.get(activityID: id);
});

final activityListFutureProvider =
    FutureProvider.autoDispose<List<Activity>?>((ref) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetchList();
});

final activityFutureProvider =
    FutureProvider.autoDispose.family<Activity?, String>((ref, id) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetch(activityID: id);
});

final createActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Activity, String>>((ref, activityAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.create(
      activity: activityAndUserID.item1, userID: activityAndUserID.item2);
});

final updateActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Activity, String>>((ref, activityAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.update(
      activity: activityAndUserID.item1, userID: activityAndUserID.item2);
});

final deleteActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.delete(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final fetchListByCategoryFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<Activity>?>?, Tuple2<String, String>>(
        (ref, pageAndActivityCategoryID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetchListByCategory(
      page: pageAndActivityCategoryID.item1,
      activityCategoryID: pageAndActivityCategoryID.item2);
});

final fetchListByLocationFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<Activity>?>?, Tuple2<String, String>>(
        (ref, pageAndActivityLocationID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetchListByLocation(
      page: pageAndActivityLocationID.item1,
      activityLocationID: pageAndActivityLocationID.item2);
});

final activityLikedByUserFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.activityLikedByUser(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final activityUnlikedByUserFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.activityUnlikedByUser(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final activityJoinedByUserFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.activityJoinedByUser(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final activityUnjoinedByUserFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.activityUnjoinedByUser(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});
