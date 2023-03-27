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
      for (int i = 0; i < _activities.value.length; i++) {
        if (_activities.value[i].id == activity.id) {
          _activities.value[i] = activity;
          return;
        } else {
          _activities.value.add(activity);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void unset({required String activityID}) {
    try {
      for (int i = 0; i < _activities.value.length; i++) {
        if (_activities.value[i].id == activityID) {
          _activities.value.removeAt(i);
          return;
        }
      }
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
  Future<Activity?> fetch({required String activityID}) async {
    try {
      await delay(addDelay);
      final futureFakeActivityList =
          Future.value(fakeActivityList).then((value) => value);
      final fetchedFakeActivityList = await futureFakeActivityList;
      for (int i = 0; i < fetchedFakeActivityList.length; i++) {
        if (fetchedFakeActivityList[i].id == activityID) {
          return fetchedFakeActivityList[i];
        }
      }
      throw Exception('Activity not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Activity>?> fetchList() async {
    try {
      await delay(addDelay);
      final fetchedFakeActivityList =
          Future.value(fakeActivityList).then((value) => value);
      return fetchedFakeActivityList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> create(
      {required Activity activity, required String userID}) async {
    try {
      await delay(addDelay);
      fakeActivityList.add(activity);
      return activity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> update(
      {required Activity activity, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      for (int i = 0; i < activities!.length; i++) {
        if (activities[i].id == activity.id) {
          activities[i] = activity;
          break;
        }
      }
      fakeActivityList = activities;
      return activity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      final int index = activities!.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity deletion failed");
      } else {
        // else, deleteactivity
        activities.removeAt(index);
      }
      fakeActivityList = activities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userHasJoinedActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      // check if user has joined activity
      final List<Activity>? activities = await fetchList();
      if (activities == null) {
        return false;
      }
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // activity not found
        throw Exception("[Activity ID Undefined]: Activity join failed");
      } else {
        for (int i = 0; i < activities[index].participants!.length; i++) {
          if (activities[index].participants![i].id == userID) {
            return true;
          }
        }
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userHasLikedActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      // check if user has liked activity
      final List<Activity>? activities = await fetchList();
      if (activities == null) {
        return false;
      }
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // activity not found
        throw Exception("[Activity ID Undefined]: Activity like failed");
      } else {
        for (int i = 0; i < activities[index].likedUsers!.length; i++) {
          if (activities[index].likedUsers![i].id == userID) {
            return true;
          }
        }
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userLikeActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      final int index = activities!.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // activity not found
        throw Exception("[Activity ID Undefined]: Activity like failed");
      } else {
        for (int i = 0; i < fakeUserList.length; i++) {
          if (fakeUserList[i].id == userID) {
            if (activities[index].likedUsers == null) {
              activities[index].likedUsers = List.empty(growable: true);
            }
            activities[index].likedUsers!.add(fakeUserList[i]);
            fakeActivityList = activities;
            return true;
          }
        }
        throw Exception("[User ID Undefined]: Activity like failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userUnlikeActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      final int index = activities!.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity unlike failed");
      } else {
        for (int i = 0; i < activities[index].likedUsers!.length; i++) {
          if (activities[index].likedUsers![i].id == userID) {
            activities[index].likedUsers!.removeAt(i);
            fakeActivityList = activities;
            return true;
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity unlike failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userJoinActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      final int index = activities!.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity join failed");
      } else {
        for (int i = 0; i < fakeUserList.length; i++) {
          if (fakeUserList[i].id == userID) {
            if (activities[index].participants == null) {
              activities[index].participants = List.empty(growable: true);
            }
            activities[index].participants!.add(fakeUserList[i]);
            fakeActivityList = activities;
            return true;
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity join failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> userUnjoinActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity>? activities = await fetchList();
      final int index = activities!.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity unjoin failed");
      } else {
        for (int i = 0; i < activities[index].participants!.length; i++) {
          if (activities[index].participants![i].id == userID) {
            activities[index].participants!.removeAt(i);
            fakeActivityList = activities;
            return true;
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity unjoin failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) async {
    try {
      await delay(addDelay);
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
      return Tuple2<String, List<Activity>?>(page, listByCategory);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID}) async {
    try {
      await delay(addDelay);
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
      return Tuple2<String, List<Activity>?>(page, listByLocation);
    } catch (e) {
      rethrow;
    }
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
