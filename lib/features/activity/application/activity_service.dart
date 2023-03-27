import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';

class ActivityService {
  final Ref ref;

  ActivityService(this.ref);

  Activity? get({required String activityID}) {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return activityRepo.get(activityID: activityID);
  }

  List<Activity>? getList() {
    try {
      final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
      return activityRepo.getList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Activity?> fetch({required String activityID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    final Activity? fetchedActivity =
        await activityRepo.fetch(activityID: activityID);
    if (fetchedActivity != null) {
      // activityRepo.set(activity: fetchedActivity);
    } else {
      throw Exception('Activity fetched is null');
    }
    return fetchedActivity;
  }

  Future<List<Activity>?> fetchList() async {
    try {
      final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
      final List<Activity>? fetchedActivityList =
          await activityRepo.fetchList();
      if (fetchedActivityList != null) {
        activityRepo.setList(activityList: fetchedActivityList);
      } else {
        throw Exception('Activity fetched is null');
      }
      return fetchedActivityList;
    } catch (e) {
      rethrow;
    }
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

  // Future<bool> userHasJoinedActivity(
  //     {required String activityID, required String userID}) async {
  //   try {
  //     final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
  //     return await activityRepo.userHasJoinedActivity(
  //         activityID: activityID, userID: userID);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<bool> userHasLikedActivity(
  //     {required String activityID, required String userID}) async {
  //   try {
  //     final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
  //     return await activityRepo.userHasLikedActivity(
  //         activityID: activityID, userID: userID);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<bool> userLikeActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.userLikeActivity(
        activityID: activityID, userID: userID);
  }

  Future<bool> userUnlikeActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.userUnlikeActivity(
        activityID: activityID, userID: userID);
  }

  Future<bool> userJoinActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.userJoinActivity(
        activityID: activityID, userID: userID);
  }

  Future<bool> userUnjoinActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.userUnjoinActivity(
        activityID: activityID, userID: userID);
  }

  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) async {
    final IntfActivityRepo repo = ref.read(activityRepoProvider);
    final listByCategory = await repo.fetchListByCategory(
        page: page, activityCategoryID: activityCategoryID);
    return listByCategory;
  }

  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID}) async {
    final IntfActivityRepo repo = ref.read(activityRepoProvider);
    final listByLocation = await repo.fetchListByLocation(
        page: page, activityLocationID: activityLocationID);
    return listByLocation;
  }
}

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService(ref);
});

final activityProvider = Provider.family<Activity?, String>((ref, id) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.get(activityID: id);
});

final activityListProvider = Provider<List<Activity>?>((ref) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.getList();
});

final activityFutureProvider =
    FutureProvider.autoDispose.family<Activity?, String>((ref, id) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetch(activityID: id);
});

final activityListFutureProvider =
    FutureProvider.autoDispose<List<Activity>?>((ref) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  return activityService.fetchList();
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

final userLikeActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.userLikeActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userUnlikeActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.userUnlikeActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userJoinActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.userJoinActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userUnjoinActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) {
  final ActivityService activityService = ref.read(activityServiceProvider);
  activityService.userUnjoinActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});