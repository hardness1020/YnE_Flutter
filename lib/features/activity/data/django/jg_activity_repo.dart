import 'package:tuple/tuple.dart';
import 'package:yne_flutter/api/api.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class DjangoActivityRepo extends IntfActivityRepo {
  final InMemoryStore<List<Activity>> _activities =
      InMemoryStore<List<Activity>>(<Activity>[]);

  final bool addDelay;

  DjangoActivityRepo({this.addDelay = true});

  @override
  Future<List<Activity>> list() async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.activityList[0],
        path: YNEApi.activityList[1],
      );
      return (responseData['results'] as List)
          .map((e) => Activity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity?> create(
      {required Activity activity, required String userID}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String activityID, required String userID}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Activity?> fetch({required String activityID}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<Activity>?> fetchList() {
    // TODO: implement fetchList
    throw UnimplementedError();
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
  Activity? get({required String activityID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<Activity>? getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  void set({required Activity activity}) {
    // TODO: implement set
  }

  @override
  void setList({required List<Activity> activityList}) {
    // TODO: implement setList
  }

  @override
  void unset({required String activityID}) {
    // TODO: implement unset
  }

  @override
  Future<Activity?> update(
      {required Activity activity, required String userID}) {
    // TODO: implement update
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

  @override
  Future<Activity> userJoinActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userJoinActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> userLikeActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userLikeActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> userUnjoinActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userUnjoinActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> userUnlikeActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userUnlikeActivity
    throw UnimplementedError();
  }

  @override
  Stream<Activity?> watch({required String activityID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<Activity>?> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }

  @override
  Future<Activity> userToggleJoinActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userToggleJoinActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> userToggleLikeActivity(
      {required String activityID, required String userID}) {
    // TODO: implement userToggleLikeActivity
    throw UnimplementedError();
  }
}
