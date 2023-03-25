import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';

class ActivityService {
  final Ref ref;

  ActivityService(this.ref);

  Future<List<Activity>> list() async {
    final activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.list();
  }

  Future<Activity> retrieve({required String id}) async {
    final activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.retrieve(id: id);
  }

  Future<Tuple2<String, List<Activity>>> listFromCategory(
      {required String page, required String categoryId}) async {
    final activityRepo = ref.read(activityRepoProvider);
    return await activityRepo.listFromCategory(page: page, categoryId: categoryId);
  }
}

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService(ref);
});

final activityListProvider = FutureProvider.autoDispose((ref) async {
  final activityService = ref.read(activityServiceProvider);
  return activityService.list();
});

final activityProvider =
    FutureProvider.autoDispose.family<Activity?, String>((ref, id) async {
  final activityService = ref.read(activityServiceProvider);
  return activityService.retrieve(id: id);
});