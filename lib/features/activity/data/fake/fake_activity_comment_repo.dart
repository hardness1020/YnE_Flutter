import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_comment_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';

class FakeActivityCommentRepo extends IntfActivityCommentRepo {
  @override
  Future<ActivityComment> create(
      {required ActivityComment activityComment}) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String activityCommentID}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ActivityComment?> fetch({required String activityCommentID}) async {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<ActivityComment>>> fetchByActivity(
      {required String page, required String activityCommentID}) async {
    // TODO: implement fetchByActivity
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityComment>> fetchList() async {
    // TODO: implement fetchList
    throw UnimplementedError();
  }

  @override
  ActivityComment? get({required String activityCommentID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<ActivityComment> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<void> set({required ActivityComment activityComment}) async {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setList(
      {required List<ActivityComment> activityCommentList}) async {
    // TODO: implement setList
    throw UnimplementedError();
  }

  @override
  Future<ActivityComment> update(
      {required ActivityComment activityComment}) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<ActivityComment?> watch({required String activityCommentID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<ActivityComment>> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }
}
