import 'package:tuple/tuple.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeActivityRepo extends IntfActivityRepo {
  final InMemoryStore<List<Activity>> _activities =
      InMemoryStore<List<Activity>>(List.from(fakeActivityList));

  final bool addDelay;

  FakeActivityRepo({this.addDelay = true});

  @override
  List<Activity>? getList() {
    return _activities.value;
  }

  @override
  Activity? get({required String activityID}) {
    return _get(activityList: _activities.value, activityID: activityID);
  }

  @override
  Future<void> setList({required List<Activity> activityList}) async {
    await delay(addDelay);
    fakeActivityList.addAll(activityList);
  }

  @override
  Future<void> set({required Activity activity}) async {
    await delay(addDelay);
    fakeActivityList.add(activity);
  }

  @override
  Future<List<Activity>?> fetchList() async {
    final futureFakeActivityList =
        Future.value(fakeActivityList).then((value) => value);
    final fetchedFakeActivityList = await futureFakeActivityList;
    return fetchedFakeActivityList;
  }

  @override
  Future<Activity?> fetch({required String activityID}) async {
    final futureFakeActivityList =
        Future.value(fakeActivityList).then((value) => value);
    final fetchedFakeActivityList = await futureFakeActivityList;
    for (int i = 0; i < fetchedFakeActivityList.length; i++) {
      if (fetchedFakeActivityList[i].id == activityID) {
        return fetchedFakeActivityList[i];
      }
    }
    throw Exception('Activity not found');
  }

  @override
  Stream<List<Activity>?> watchList() {
    return _activities.stream;
  }

  @override
  Stream<Activity?> watch({required String activityID}) {
    return watchList().map(
        (activities) => _get(activityList: activities, activityID: activityID));
  }

  @override
  Future<void> create(
      {required Activity activity, required String userID}) async {
    await delay(addDelay);
    fakeActivityList.add(activity);
  }

  @override
  Future<void> update(
      {required Activity activity, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activity.id);
    if (index == -1) {
      // if not found, add as a new activity
      await set(activity: activity);
    } else {
      // else, overwrite previous activity
      activities[index] = activity;
    }
    fakeActivityList = activities;
  }

  @override
  Future<void> delete(
      {required String activityID, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activityID);
    if (index == -1) {
      // not found
      print("[Activity ID Undefined]: Activity deletion failed");
    } else {
      // else, deleteactivity
      activities.removeAt(index);
    }
    fakeActivityList = activities;
  }

  @override
  Future<void> activityLikedByUser(
      {required String activityID, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activityID);
    if (index == -1) {
      // activity not found
      print("[Activity ID Undefined]: Activity like failed");
    } else {
      for (int i = 0; i < fakeUserList.length; i++) {
        if (fakeUserList[i].id == userID) {
          if (activities[index].likedUsers == null) {
            activities[index].likedUsers = List.empty(growable: true);
          }
          activities[index].likedUsers!.add(fakeUserList[i]);
          break;
        }
      }
    }
    fakeActivityList = activities;
  }

  @override
  Future<void> activityUnlikedByUser(
      {required String activityID, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activityID);
    if (index == -1) {
      // not found
      print("[Activity ID Undefined]: Activity unlike failed");
    } else {
      for (int i = 0; i < activities[index].likedUsers!.length; i++) {
        if (activities[index].likedUsers![i].id == userID) {
          activities[index].likedUsers!.removeAt(i);
        }
      }
    }
    fakeActivityList = activities;
  }

  @override
  Future<void> activityJoinedByUser(
      {required String activityID, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activityID);
    if (index == -1) {
      // not found
      print("[Activity ID Undefined]: Activity like failed");
    } else {
      for (int i = 0; i < fakeUserList.length; i++) {
        if (fakeUserList[i].id == userID) {
          if (activities[index].participants == null) {
            activities[index].participants = List.empty(growable: true);
          }
          activities[index].participants!.add(fakeUserList[i]);
          break;
        }
      }
    }
    fakeActivityList = activities;
  }

  @override
  Future<void> activityUnjoinedByUser(
      {required String activityID, required String userID}) async {
    final List<Activity>? activities = await fetchList();
    final int index = activities!.indexWhere((p) => p.id == activityID);
    if (index == -1) {
      // not found
      print("[Activity ID Undefined]: Activity unlike failed");
    } else {
      for (int i = 0; i < activities[index].participants!.length; i++) {
        if (activities[index].participants![i].id == userID) {
          activities[index].participants!.removeAt(i);
        }
      }
    }
    fakeActivityList = activities;
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) async {
    final List<Activity>? activities = await fetchList();
    List<Activity> listByCategory = <Activity>[];
    for (int i = 0; i < activities!.length; i++) {
      if (activities[i].categories == null) {
        continue;
      }
      for (int j = 0; j < activities[i].categories!.length; j++) {
        if (activities[i].categories![j].id == activityCategoryID) {
          listByCategory.add(activities[i]);
        }
      }
    }
    return Future.value(Tuple2<String, List<Activity>?>(page, listByCategory));
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID}) async {
    final List<Activity>? activities = await fetchList();
    List<Activity> listByLocation = <Activity>[];
    // write for loop to filter out activities by location
    for (int i = 0; i < activities!.length; i++) {
      if (activities[i].location == null) {
        continue;
      }
      if (activities[i].location!.id == activityLocationID) {
        listByLocation.add(activities[i]);
      }
    }
    return Future.value(Tuple2<String, List<Activity>?>(page, listByLocation));
  }

  static Activity? _get(
      {required List<Activity>? activityList, required String activityID}) {
    return activityList!.firstWhere((activity) => activity.id == activityID);
  }
}
