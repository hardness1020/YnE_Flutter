import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

abstract class IntfActivityCategoryRepo {
  Future<List<ActivityCategory>> list();
  Future<ActivityCategory> retrieve({required String id});
}

final activityCategoryRepoProvider = Provider<IntfActivityCategoryRepo>((ref) {
  final activityCategoryRepo =
      kUseFakeRepos ? FakeActivityCategoryRepo() : JgActivityCategoryRepo();
  return activityCategoryRepo;
});
