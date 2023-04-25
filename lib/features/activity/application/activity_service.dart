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

  Future<Tuple2<String, List<Activity>?>> fetchList(
      {required String page}) async {
    try {
      final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
      final Tuple2<String, List<Activity>?> pageAndFetchedActivityList =
          await activityRepo.fetchList(page: page);
      if (pageAndFetchedActivityList.item2 != null) {
        activityRepo.setList(activityList: pageAndFetchedActivityList.item2!);
      } else {
        throw Exception('Activity fetched is null');
      }
      return pageAndFetchedActivityList;
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

  Future<void> create(
      {required Activity activity, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity? createdActivity =
        await activityRepo.create(activity: activity, userID: userID);
    activityRepo.set(activity: createdActivity!);
  }

  Future<void> update(
      {required Activity activity, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    Activity? updatedActivity =
        await activityRepo.update(activity: activity, userID: userID);
    activityRepo.set(activity: updatedActivity!);
  }

  Future<void> delete(
      {required String activityID, required String userID}) async {
    final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
    await activityRepo.delete(activityID: activityID, userID: userID);
    activityRepo.unset(activityID: activityID);
  }

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

  // Future<bool> userHasJoinedActivity(
  //     { required String activityID, required String userID}) async {
  //   try {
  //     final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
  //     return await activityRepo.userHasJoinedActivity(
  //         activityID: activityID, userID: userID);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<bool> userHasLikedActivity(
  //     { required String activityID, required String userID}) async {
  //   try {
  //     final IntfActivityRepo activityRepo = ref.read(activityRepoProvider);
  //     return await activityRepo.userHasLikedActivity(
  //         activityID: activityID, userID: userID);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
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
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return activityService.fetch(activityID: id);
});

final activityListFutureProvider = FutureProvider.autoDispose
    .family<Tuple2<String, List<Activity>?>, String>((ref, page) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.fetchList(page: page);
});

final createActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Activity, String>>((ref, activityAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  await activityService.create(
      activity: activityAndUserID.item1, userID: activityAndUserID.item2);
});

final updateActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple3<String, Activity, String>>(
        (ref, pageActivityAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.update(
      activity: pageActivityAndUserID.item2,
      userID: pageActivityAndUserID.item3);
});

final deleteActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  await activityService.delete(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userLikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userLikeActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userUnlikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userUnlikeActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userToggleLikeActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userToggleLikeActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userJoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userJoinActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userUnjoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userUnjoinActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
});

final userToggleJoinActivityFutureProvider = FutureProvider.autoDispose
    .family<Activity, Tuple3<String, String, String>>(
        (ref, pageActivityIDAndUserID) async {
  final ActivityService activityService = ref.watch(activityServiceProvider);
  return await activityService.userToggleJoinActivity(
      activityID: pageActivityIDAndUserID.item2,
      userID: pageActivityIDAndUserID.item3);
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

// final userHasLikedActivityFutureProvider = FutureProvider.autoDispose
//     .family<bool, Tuple2<String, String>>((ref, activityIDAndUserID) {
//   final ActivityService activityService = ref.read(activityServiceProvider);
//   return activityService.userHasLikedActivity(
//       activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
// });

// final userHasJoinedActivityFutureProvider = FutureProvider.autoDispose
//     .family<bool, Tuple2<String, String>>((ref, activityIDAndUserID) {
//   final ActivityService activityService = ref.read(activityServiceProvider);
//   return activityService.userHasJoinedActivity(
//       activityID: activityIDAndUserID.item1, userID: activityIDAndUserID.item2);
// });