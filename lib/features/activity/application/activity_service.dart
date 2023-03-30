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
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    return activityRepo.getList();
  }

  Future<Activity?> fetch({required String activityID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    final Activity? fetchedActivity =
        await activityRepo.fetch(activityID: activityID);
    if (fetchedActivity != null) {
      activityRepo.set(activity: fetchedActivity);
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

  Future<Activity> userLikeActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity likedActivity = await activityRepo.userLikeActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: likedActivity);
    return likedActivity;
  }

  Future<Activity> userUnlikeActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity unlikedActivity = await activityRepo.userUnlikeActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: unlikedActivity);
    return unlikedActivity;
  }

  Future<Activity> userToggleLikeActivity({
    required String activityID,
    required String userID,
  }) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity likeToggledActivity = await activityRepo.userToggleLikeActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: likeToggledActivity);
    return likeToggledActivity;
  }

  Future<Activity> userJoinActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity joinedActivity = await activityRepo.userJoinActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: joinedActivity);
    return joinedActivity;
  }

  Future<Activity> userUnjoinActivity(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity unjoinedActivity = await activityRepo.userUnjoinActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: unjoinedActivity);
    return unjoinedActivity;
  }

  Future<Activity> userToggleJoinActivity({
    required String activityID,
    required String userID,
  }) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity likeToggledActivity = await activityRepo.userToggleJoinActivity(
        activityID: activityID, userID: userID);
    activityRepo.set(activity: likeToggledActivity);
    return likeToggledActivity;
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
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return activityService.get(activityID: id);
});

final activityListProvider = Provider<List<Activity>?>((ref) {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return activityService.getList();
});

final activityFutureProvider =
    FutureProvider.autoDispose.family<Activity?, String>((ref, id) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.fetch(activityID: id);
});

final activityListFutureProvider =
    FutureProvider.autoDispose.family<List<Activity>?, String>((ref, page) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.fetchList();
});

final createActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Activity, String>>((ref, activityAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  await activityService.create(
      activity: activityAndUserID.item1, userID: activityAndUserID.item2);
});

final updateActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Activity, String>>((ref, activityAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.update(
      activity: activityAndUserID.item1, userID: activityAndUserID.item2);
});

final deleteActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  await activityService.delete(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final fetchListByCategoryFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<Activity>?>?, Tuple2<String, String>>(
        (ref, pageAndActivityCategoryID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.fetchListByCategory(
      page: pageAndActivityCategoryID.item1,
      activityCategoryID: pageAndActivityCategoryID.item2);
});

final fetchListByLocationFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<Activity>?>?, Tuple2<String, String>>(
        (ref, pageAndActivityLocationID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.fetchListByLocation(
      page: pageAndActivityLocationID.item1,
      activityLocationID: pageAndActivityLocationID.item2);
});

final userLikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userLikeActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userUnlikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userUnlikeActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userToggleLikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDandUserId) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userToggleLikeActivity(
      activityID: activityIDandUserId.item1, userID: activityIDandUserId.item2);
});

final userJoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userJoinActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userUnjoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userUnjoinActivity(
      activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
});

final userToggleJoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple2<String, String>>((ref, activityIDandUserId) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userToggleJoinActivity(
      activityID: activityIDandUserId.item1, userID: activityIDandUserId.item2);
});

// final userHasLikedActivityFutureProvider = FutureProvider.autoDispose
//     .family<bool, Tuple2<String, String>>((ref, activityIDAndUserID) {
//   final ActivityService activityService = ref.watch(activityServiceProvider);
//   return activityService.userHasLikedActivity(
//       activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
// });

// final userHasJoinedActivityFutureProvider = FutureProvider.autoDispose
//     .family<bool, Tuple2<String, String>>((ref, activityIDAndUserID) {
//   final ActivityService activityService = ref.watch(activityServiceProvider);
//   return activityService.userHasJoinedActivity(
//       activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
// });