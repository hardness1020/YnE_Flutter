import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_location_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';

class DjangoActivityLocationRepo extends IntfActivityLocationRepo {
  @override
  Future<ActivityLocation> create(
      {required ActivityLocation activityLocation}) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String activityLocationID}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ActivityLocation?> fetch({required String activityLocationID}) async {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<ActivityLocation>>> fetchByActivity(
      {required String page, required String activityLocationID}) async {
    // TODO: implement fetchByActivity
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityLocation>> fetchList() async {
    // TODO: implement fetchList
    throw UnimplementedError();
  }

  @override
  ActivityLocation? get({required String activityLocationID}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<ActivityLocation> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<void> set({required ActivityLocation activityLocation}) async {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setList(
      {required List<ActivityLocation> activityLocationList}) async {
    // TODO: implement setList
    throw UnimplementedError();
  }

  @override
  Future<ActivityLocation> update(
      {required ActivityLocation activityLocation}) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<ActivityLocation?> watch({required String activityLocationID}) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<ActivityLocation>> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }
}
