import 'package:tuple/tuple.dart';
import 'package:yne_flutter/api/api.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class DjangoActivityRepo extends IntfActivityRepo {
  final InMemoryStore<List<Activity>> _activities =
      InMemoryStore<List<Activity>>(List.from(<Activity>[]));

  DjangoActivityRepo();

  @override
  Stream<Activity?> watch({required String activityID}) {
    try {
      return watchList().map((activities) =>
          _get(activityList: activities, activityID: activityID));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Activity>?> watchList() {
    try {
      return _activities.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Activity? get({required String activityID}) {
    try {
      return _get(activityList: _activities.value, activityID: activityID);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Activity>? getList() {
    try {
      return _activities.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void set({required Activity activity}) {
    try {
      final List<Activity> activities = _activities.value;
      for (int i = 0; i < activities.length; i++) {
        if (activities[i].id == activity.id) {
          activities[i] = activity;
          return;
        } else {
          activities.add(activity);
        }
      }
      _activities.value = activities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void unset({required String activityID}) {
    try {
      final List<Activity> activities = _activities.value;
      for (int i = 0; i < activities.length; i++) {
        if (activities[i].id == activityID) {
          activities.removeAt(i);
          return;
        }
      }
      _activities.value = activities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setList({required List<Activity> activityList}) {
    try {
      _activities.value = activityList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Activity>?> fetchList({required String page}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.activityList(page)[0],
        path: YNEApi.activityList(page)[1],
      );
      return (responseData['results'] as List)
          .map((activity) => Activity.fromJson(activity))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> fetch({required String activityID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
          method: YNEApi.activityRetrieve(activityID)[0],
          path: YNEApi.activityRetrieve(activityID)[1]);
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> create(
      {required Activity activity, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
          method: YNEApi.activityCreate[0],
          path: YNEApi.activityCreate[1],
          postData: {'activity': activity.toJson(), 'host': userID});
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(
      {required String activityID, required String userID}) async {
    try {
      await NetUtils().reqeustData(
          method: YNEApi.activityDelete(activityID)[0],
          path: YNEApi.activityDelete(activityID)[1],
          postData: {'host': userID});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> update(
      {required Activity activity, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.activityUpdate(activity.id!)[0],
        path: YNEApi.activityUpdate(activity.id!)[1],
        postData: {'activity': activity.toJson(), 'host': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userLikeActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userLikeActivity(activityID)[0],
        path: YNEApi.userLikeActivity(activityID)[1],
        postData: {'liked_user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userUnlikeActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userUnlikeActivity(activityID)[0],
        path: YNEApi.userUnlikeActivity(activityID)[1],
        postData: {'unliked_user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userJoinActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userJoinActivity(activityID)[0],
        path: YNEApi.userJoinActivity(activityID)[1],
        postData: {'joined_user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userUnjoinActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userUnjoinActivity(activityID)[0],
        path: YNEApi.userUnjoinActivity(activityID)[1],
        postData: {'unjoined_user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userToggleLikeActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userToggleLikeActivity(activityID)[0],
        path: YNEApi.userToggleLikeActivity(activityID)[1],
        postData: {'user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userToggleJoinActivity(
      {required String activityID, required String userID}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.userToggleJoinActivity(activityID)[0],
        path: YNEApi.userToggleJoinActivity(activityID)[1],
        postData: {'user': userID},
      );
      return Activity.fromJson(responseData['results']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) {
    // TODO: implement fetchListByCategory
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID}) {
    // TODO: implement fetchListByLocation
    throw UnimplementedError();
  }

  @override
  Future<bool> userHasJoinedActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userHasJoinedActivity
    throw UnimplementedError();
  }

  @override
  Future<bool> userHasLikedActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userHasLikedActivity
    throw UnimplementedError();
  }

  static Activity? _get(
      {required List<Activity>? activityList, required String activityID}) {
    try {
      return activityList!.firstWhere((activity) => activity.id == activityID);
    } catch (e) {
      rethrow;
    }
  }
}
