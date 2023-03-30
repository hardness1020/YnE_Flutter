import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

abstract class IntfActivityCategoryRepo {
  ActivityCategory? get({required String activityCategoryID});

  List<ActivityCategory>? getList();

  Future<void> set({required ActivityCategory activityCategory});

  Future<void> setList({required List<ActivityCategory> activityCategoryList});

  Future<ActivityCategory?> fetch({required String activityCategoryID});

  Future<List<ActivityCategory>?> fetchList();

  Stream<ActivityCategory?> watch({required String activityCategoryID});

  Stream<List<ActivityCategory>?> watchList();

  Future<void> create(
      {required ActivityCategory activityCategory, required String userID});

  Future<void> delete(
      {required String activityCategoryID, required String userID});
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
    StreamProvider.autoDispose<List<ActivityCategory>?>((ref) {
  final activityCategoryListService = ref.watch(activityCategoryRepoProvider);
  return activityCategoryListService.watchList();
});
