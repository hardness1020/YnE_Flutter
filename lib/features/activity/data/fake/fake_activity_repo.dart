import 'dart:io';

import 'package:tuple/tuple.dart';
import 'package:yne_flutter/constants/total_pages.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
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
      final activities = _activities.value;
      for (int i = 0; i < activities.length; i++) {
        if (activities[i].id == activity.id) {
          activities[i] = activity;
          break;
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
      final activities = _activities.value;
      for (int i = 0; i < activities.length; i++) {
        if (activities[i].id == activityID) {
          activities.removeAt(i);
          break;
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
  Future<Tuple2<String, List<Activity>?>> fetchList({required String page}) async {
    try {
      await delay(addDelay);
      List<Activity>? pagedActivityList;
      int startingPage = int.parse(page);
      activityTotalPages = fakeActivityList.length ~/ activityPerPage;
      if (startingPage > activityTotalPages) {
        pagedActivityList = fakeActivityList
            .skip((activityTotalPages - 1) * activityPerPage)
            .take(activityPerPage)
            .toList();
      } else {
        pagedActivityList = fakeActivityList
            .skip((startingPage - 1) * activityPerPage)
            .take(activityPerPage)
            .toList();
      }
      activityTotalPages = fakeActivityList.length;
      return Tuple2(page, pagedActivityList);
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
      final List<Activity> activities = _activities.value;
      for (int i = 0; i < activities.length; i++) {
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
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity deletion failed");
      } else {
        // else, delete activity
        activities.removeAt(index);
      }
      fakeActivityList = activities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userLikeActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // activity not found
        throw Exception("[Activity ID Undefined]: Activity like failed");
      } else {
        List<BackendUser> allFakeUsers = fakeOtherUserList + [fakeHeroUser];
        for (int i = 0; i < allFakeUsers.length; i++) {
          if (allFakeUsers[i].id == userID) {
            if (activities[index].likedUsers == null) {
              activities[index].likedUsers = List.empty(growable: true);
            }
            activities[index].likedUsers!.add(allFakeUsers[i]);
            activities[index].isLiked = true;
            fakeActivityList = activities;
            return activities[index];
          }
        }
        throw Exception("[User ID Undefined]: Activity like failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userUnlikeActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity unlike failed");
      } else {
        for (int i = 0; i < activities[index].likedUsers!.length; i++) {
          if (activities[index].likedUsers![i].id == userID) {
            activities[index].likedUsers!.removeAt(i);
            activities[index].isLiked = false;
            fakeActivityList = activities;
            return activities[index];
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity unlike failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userToggleLikeActivity({
    required String activityID,
    required String userID,
  }) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity toggle failed");
      } else {
        List<BackendUser> allFakeUsers = fakeOtherUserList + [fakeHeroUser];
        for (int i = 0; i < allFakeUsers.length; i++) {
          if (allFakeUsers[i].id == userID) {
            if (activities[index].likedUsers == null) {
              activities[index].likedUsers = List.empty(growable: true);
            }
            if (activities[index].isLiked == null) {
              activities[index].isLiked = false;
            }
            if (activities[index].isLiked ?? false) {
              activities[index].likedUsers!.remove(allFakeUsers[i]);
              activities[index].isLiked = false;
            } else {
              activities[index].likedUsers!.add(allFakeUsers[i]);
              activities[index].isLiked = true;
            }
            fakeActivityList = activities;
            return activities[index];
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity toggle failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userJoinActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity join failed");
      } else {
        List<BackendUser> allFakeUsers = fakeOtherUserList + [fakeHeroUser];
        for (int i = 0; i < allFakeUsers.length; i++) {
          if (allFakeUsers[i].id == userID) {
            if (activities[index].participants == null) {
              activities[index].participants = List.empty(growable: true);
            }
            activities[index].participants!.add(allFakeUsers[i]);
            activities[index].isJoined = true;
            fakeActivityList = activities;
            return activities[index];
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity join failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userUnjoinActivity(
      {required String activityID, required String userID}) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity unjoin failed");
      } else {
        for (int i = 0; i < activities[index].participants!.length; i++) {
          if (activities[index].participants![i].id == userID) {
            activities[index].participants!.removeAt(i);
            activities[index].isJoined = false;
            fakeActivityList = activities;
            return activities[index];
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity unjoin failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> userToggleJoinActivity({
    required String activityID,
    required String userID,
  }) async {
    try {
      await delay(addDelay);
      final List<Activity> activities = _activities.value;
      final int index = activities.indexWhere((p) => p.id == activityID);
      if (index == -1) {
        // not found
        throw Exception("[Activity ID Undefined]: Activity toggle failed");
      } else {
        List<BackendUser> allFakeUsers = fakeOtherUserList + [fakeHeroUser];
        for (int i = 0; i < allFakeUsers.length; i++) {
          if (allFakeUsers[i].id == userID) {
            if (activities[index].participants == null) {
              activities[index].participants = List.empty(growable: true);
            }
            if (activities[index].isJoined == null) {
              activities[index].isJoined = false;
            }
            if (activities[index].isJoined ?? false) {
              activities[index].participants!.remove(allFakeUsers[i]);
              activities[index].isJoined = false;
            } else {
              activities[index].participants!.add(allFakeUsers[i]);
              activities[index].isJoined = true;
            }
            fakeActivityList = activities;
            return activities[index];
          }
        }
      }
      throw Exception("[User ID Undefined]: Activity toggle failed");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID}) async {
    try {
      await delay(addDelay);
      final pageAndActivities = await fetchList(page: page);
      final List<Activity>? activities = pageAndActivities.item2;
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
      final pageAndActivities = await fetchList(page: page);
      final List<Activity>? activities = pageAndActivities.item2;
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

  @override
  Future<Activity?> updateActivityBackground(
      {required String activityID,
      required String userID,
      required File background}) {
    // TODO: implement updateActivityBackground
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

  // @override
  // Future<bool> userHasJoinedActivity(
  //     {
  //     required String activityID,
  //     required String userID}) async {
  //   try {
  //     await delay(addDelay);
  //     // check if user has joined activity
  //     final List<Activity>? activities = await fetchList(page:page);
  //     if (activities == null) {
  //       return false;
  //     }
  //     final int index = activities.indexWhere((p) => p.id == activityID);
  //     if (index == -1) {
  //       // activity not found
  //       throw Exception("[Activity ID Undefined]: Activity join failed");
  //     } else {
  //       for (int i = 0; i < activities[index].participants!.length; i++) {
  //         if (activities[index].participants![i].id == userID) {
  //           return true;
  //         }
  //       }
  //       return false;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<bool> userHasLikedActivity(
  //     {
  //     required String activityID,
  //     required String userID}) async {
  //   try {
  //     await delay(addDelay);
  //     // check if user has liked activity
  //     final List<Activity>? activities = await fetchList(page:page);
  //     if (activities == null) {
  //       return false;
  //     }
  //     final int index = activities.indexWhere((p) => p.id == activityID);
  //     if (index == -1) {
  //       // activity not found
  //       throw Exception("[Activity ID Undefined]: Activity like failed");
  //     } else {
  //       for (int i = 0; i < activities[index].likedUsers!.length; i++) {
  //         if (activities[index].likedUsers![i].id == userID) {
  //           return true;
  //         }
  //       }
  //       return false;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }