import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';


class ActivityCategoryService {
  final Ref ref;

  ActivityCategoryService(this.ref);

  Future<List<ActivityCategory>> list() async {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return await activityCategoryRepo.list();
  }

  Future<ActivityCategory> retrieve({required String id}) async {
    final activityCategoryRepo = ref.read(activityCategoryRepoProvider);
    return await activityCategoryRepo.retrieve(id: id);
  }
}

final activityCategoryServiceProvider = Provider<ActivityCategoryService>((ref) {
  return ActivityCategoryService(ref);
});

final activityCategoryListProvider =
    FutureProvider.autoDispose((ref) async {
  final activityCategoryService = ref.read(activityCategoryServiceProvider);
  return activityCategoryService.list();
});
