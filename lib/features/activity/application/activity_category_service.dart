import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';

class ActivityCategoryService {
  final Ref ref;

  ActivityCategoryService(this.ref);

  ActivityCategory? get({required String activityCategoryID}) {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    return activityCategoryRepo.get(activityCategoryID: activityCategoryID);
  }

  List<ActivityCategory>? getlist() {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    return activityCategoryRepo.getList();
  }

  Future<ActivityCategory?> fetch({required String activityCategoryID}) async {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    return await activityCategoryRepo.fetch(
        activityCategoryID: activityCategoryID);
  }

  Future<List<ActivityCategory>?> fetchList() async {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    return await activityCategoryRepo.fetchList();
  }

  Future<void> create(
      {required ActivityCategory activityCategory,
      required String userID}) async {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    await activityCategoryRepo.create(
        activityCategory: activityCategory, userID: userID);
  }

  Future<void> delete(
      {required String activityCategoryID, required String userID}) async {
    final activityCategoryRepo = ref.watch(activityCategoryRepoProvider);
    await activityCategoryRepo.delete(
        activityCategoryID: activityCategoryID, userID: userID);
  }
}

final activityCategoryServiceProvider =
    Provider<ActivityCategoryService>((ref) {
  return ActivityCategoryService(ref);
});

final activityCategorytProvider =
    Provider.family<ActivityCategory?, String>((ref, id) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.get(activityCategoryID: id);
});

final activityCategoryListProvider = Provider<List<ActivityCategory>?>((ref) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.getlist();
});

final activityCategoryFuturetProvider =
    FutureProvider.family<ActivityCategory?, String>((ref, id) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.fetch(activityCategoryID: id);
});

final activityCategoryListFutureProvider =
    FutureProvider.autoDispose<List<ActivityCategory>?>((ref) {
  final activityCategoryListService =
      ref.watch(activityCategoryServiceProvider);
  return activityCategoryListService.fetchList();
});

final createActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<ActivityCategory, String>>(
        (ref, activityCategoryAndUserID) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.create(
      activityCategory: activityCategoryAndUserID.item1,
      userID: activityCategoryAndUserID.item2);
});

final deleteActivityFutureProvider = FutureProvider.autoDispose
    .family<void, Tuple2<String, String>>((ref, activityCategoryIDAndUserID) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.delete(
      activityCategoryID: activityCategoryIDAndUserID.item1,
      userID: activityCategoryIDAndUserID.item2);
});
