import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

class DjangoActivityCategoryRepo extends IntfActivityCategoryRepo {
  @override
  Future<void> create({required ActivityCategory activityCategory, required String userID}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String activityCategoryID, required String userID}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ActivityCategory?> fetch({required String activityCategoryID}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityCategory>?> fetchList() {
    // TODO: implement fetchList
    throw UnimplementedError();
  }

  @override
  ActivityCategory? get({required String activityCategoryID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<ActivityCategory>? getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<void> set({required ActivityCategory activityCategory}) {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setList({required List<ActivityCategory> activityCategoryList}) {
    // TODO: implement setList
    throw UnimplementedError();
  }

  @override
  Stream<ActivityCategory?> watch({required String activityCategoryID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<ActivityCategory>?> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }
  
}
