import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_repo.dart';

abstract class IntfActivityRepo {
  // @protected
  // static Activity? _getActivity(List<Activity> products, String id);
  List<Activity>? getList();

  Activity? get({required String activityID});

  Future<void> setList({required List<Activity> activityList});

  Future<void> set({required Activity activity});

  Future<List<Activity>?> fetchList();

  Future<Activity?> fetch({required String activityID});

  Stream<List<Activity>?> watchList();

  Stream<Activity?> watch({required String activityID});

  Future<void> create({required Activity activity, required String userID});

  Future<void> update({required Activity activity, required String userID});

  Future<void> delete({required String activityID, required String userID});

  Future<void> activityLikedByUser(
      {required String activityID, required String userID});

  Future<void> activityUnlikedByUser(
      {required String activityID, required String userID});

  Future<void> activityJoinedByUser(
      {required String activityID, required String userID});

  Future<void> activityUnjoinedByUser(
      {required String activityID, required String userID});

  Future<Tuple2<String, List<Activity>?>?> fetchListByCategory(
      {required String page, required String activityCategoryID});

  Future<Tuple2<String, List<Activity>?>?> fetchListByLocation(
      {required String page, required String activityLocationID});
}

final activityRepoProvider = Provider<IntfActivityRepo>((ref) {
  final activityRepo =
      kUseFakeRepos ? FakeActivityRepo() : DjangoActivityRepo();
  return activityRepo;
});

final activityListStreamProvider =
    StreamProvider.autoDispose<List<Activity>?>((ref) {
  final activityListRepo = ref.read(activityRepoProvider);
  return activityListRepo.watchList();
});

final activityStreamProvider =
    StreamProvider.autoDispose.family<Activity?, String>((ref, id) {
  final activityListRepo = ref.read(activityRepoProvider);
  return activityListRepo.watch(activityID: id);
});
