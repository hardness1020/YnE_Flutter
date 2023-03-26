import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';

class ActivityCategoryService {
  final Ref ref;

  ActivityCategoryService(this.ref);

  ActivityCategory? get({required String activityCategoryID}) {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return activityCategoryRepo.get(activityCategoryID: activityCategoryID);
  }

  List<ActivityCategory> getlist() {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return activityCategoryRepo.getList();
  }

  Future<ActivityCategory?> fetch({required String activityCategoryID}) async {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return await activityCategoryRepo.fetch(
        activityCategoryID: activityCategoryID);
  }

  Future<List<ActivityCategory>> fetchList() async {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return activityCategoryRepo.fetchList();
  }
}

final activityCategoryServiceProvider =
    Provider<ActivityCategoryService>((ref) {
  return ActivityCategoryService(ref);
});

final activityCategorytProvider =
    Provider.family<ActivityCategory?, String>((ref, id) {
  final activityCategoryService = ref.read(activityCategoryServiceProvider);
  return activityCategoryService.get(activityCategoryID: id);
});

final activityCategoryListProvider = Provider<List<ActivityCategory>>((ref) {
  final activityCategoryService = ref.read(activityCategoryServiceProvider);
  return activityCategoryService.getlist();
});

final activityCategoryFuturetProvider =
    FutureProvider.family<ActivityCategory?, String>((ref, id) {
  final activityCategoryService = ref.watch(activityCategoryServiceProvider);
  return activityCategoryService.fetch(activityCategoryID: id);
});

final activityCategoryListFutureProvider =
    FutureProvider.autoDispose<List<ActivityCategory>>((ref) {
  final activityCategoryListService =
      ref.watch(activityCategoryServiceProvider);
  return activityCategoryListService.fetchList();
});
