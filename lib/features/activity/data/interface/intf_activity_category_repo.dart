import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

abstract class IntfActivityCategoryRepo {
  List<ActivityCategory> getList();

  ActivityCategory? get({required String activityCategoryID});

  Future<void> setList({required List<ActivityCategory> activityList});

  Future<void> set({required ActivityCategory activityCategory});

  Future<ActivityCategory?> fetch({required String activityCategoryID});

  Future<List<ActivityCategory>> fetchList(); //async

  Stream<List<ActivityCategory>> watchList();

  Stream<ActivityCategory?> watch({required String activityCategoryID});

  Future<ActivityCategory> create({required ActivityCategory activityCategory});

  Future<ActivityCategory> update({required ActivityCategory activityCategory});

  Future<void> delete({required String activityCategoryID});

  Future<Tuple2<String, List<ActivityCategory>>> fetchByActivity(
      {required String page, required String activityCategoryID});
}

final activityCategoryRepoProvider = Provider<IntfActivityCategoryRepo>((ref) {
  final activityCategoryRepo =
      kUseFakeRepos ? FakeActivityCategoryRepo() : DjangoActivityCategoryRepo();
  return activityCategoryRepo;
});

final activityCategoryStreamProvider =
    StreamProvider.family<ActivityCategory?, String>((ref, id) {
  final activityCategoryListService = ref.watch(activityCategoryRepoProvider);
  return activityCategoryListService.watch(activityCategoryID: id);
});

final activityCategoryListStreamProvider =
    StreamProvider.autoDispose<List<ActivityCategory>>((ref) {
  final activityCategoryListService = ref.watch(activityCategoryRepoProvider);
  return activityCategoryListService.watchList();
});
