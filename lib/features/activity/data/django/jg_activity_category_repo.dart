import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

class DjangoActivityCategoryRepo extends IntfActivityCategoryRepo {
  @override
  Future<ActivityCategory> create(
      {required ActivityCategory activityCategory}) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String activityCategoryID}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ActivityCategory?> fetch({required String activityCategoryID}) async {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<ActivityCategory>>> fetchByActivity(
      {required String page, required String activityCategoryID}) async {
    // TODO: implement fetchByActivity
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityCategory>> fetchList() async {
    // TODO: implement fetchList
    throw UnimplementedError();
  }

  @override
  ActivityCategory? get({required String activityCategoryID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<ActivityCategory> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<void> set({required ActivityCategory activityCategory}) async {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setList({required List<ActivityCategory> activityList}) async {
    // TODO: implement setList
    throw UnimplementedError();
  }

  @override
  Future<ActivityCategory> update(
      {required ActivityCategory activityCategory}) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<ActivityCategory?> watch({required String activityCategoryID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<ActivityCategory>> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }
}
