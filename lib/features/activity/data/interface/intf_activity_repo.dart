import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_repo.dart';

abstract class IntfActivityRepo {
  Future<List<Activity>> list();
  Future<Activity> retrieve({required String id});
  Future<Activity> create({required Activity activity});
  Future<Activity> update({required Activity activity});
  Future<Activity> delete({required String id});
  Future<void> likedByUser({required String id, required String userId});
  Future<void> unlikedByUser({required String id, required String userId});
  Future<Tuple2<String, List<Activity>>> listFromCategory(
      {required String page, required String categoryId});
}

final activityRepoProvider = Provider<IntfActivityRepo>((ref) {
  final activityRepo = kUseFakeRepos ? FakeActivityRepo() : JgActivityRepo();
  return activityRepo;
});
