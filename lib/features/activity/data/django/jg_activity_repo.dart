import 'package:tuple/tuple.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class DjangoActivityRepo extends IntfActivityRepo {
  final InMemoryStore<List<Activity>> _activities =
      InMemoryStore<List<Activity>>(<Activity>[]);

  final bool addDelay;

  DjangoActivityRepo({this.addDelay = true});

  @override
  Future<void> activityJoinedByUser(
      {required String activityID, required String userID}) {
    // TODO: implement activityJoinedByUser
    throw UnimplementedError();
  }

  @override
  Future<void> activityLikedByUser(
      {required String activityID, required String userID}) {
    // TODO: implement activityLikedByUser
    throw UnimplementedError();
  }

  @override
  Future<void> activityUnjoinedByUser(
      {required String activityID, required String userID}) {
    // TODO: implement activityUnjoinedByUser
    throw UnimplementedError();
  }

  @override
  Future<void> activityUnlikedByUser(
      {required String activityID, required String userID}) {
    // TODO: implement activityUnlikedByUser
    throw UnimplementedError();
  }

  @override
  Future<void> create({required Activity activity, required String userID}) {
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
  Future<void> set({required Activity activity}) {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setList({required List<Activity> activityList}) {
    // TODO: implement setList
    throw UnimplementedError();
  }

  @override
  Future<void> update({required Activity activity, required String userID}) {
    // TODO: implement update
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
}
