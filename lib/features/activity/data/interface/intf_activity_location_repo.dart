import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_location_repo.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_location_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';

abstract class IntfActivityLocationRepo {
  List<ActivityLocation> getList();

  ActivityLocation? get({required String activityLocationID});

  Future<void> setList({required List<ActivityLocation> activityLocationList});

  Future<void> set({required ActivityLocation activityLocation});

  Future<ActivityLocation?> fetch({required String activityLocationID});

  Future<List<ActivityLocation>> fetchList(); //async

  Stream<List<ActivityLocation>> watchList();

  Stream<ActivityLocation?> watch({required String activityLocationID});

  Future<ActivityLocation> create({required ActivityLocation activityLocation});

  Future<ActivityLocation> update({required ActivityLocation activityLocation});

  Future<void> delete({required String activityLocationID});

  Future<Tuple2<String, List<ActivityLocation>>> fetchByActivity(
      {required String page, required String activityLocationID});
}

final activityLocationRepoProvider = Provider<IntfActivityLocationRepo>((ref) {
  final activityLocationRepo =
      kUseFakeRepos ? FakeActivityLocationRepo() : DjangoActivityLocationRepo();
  return activityLocationRepo;
});

// final activityLocationProvider =
//     Provider.family<ActivityLocation?, String>((ref, id) {
//   final activityCommentListRepo = ref.watch(activityLocationRepoProvider);
//   return activityCommentListRepo.get(activityLocationID: id);
// });

// final activityLocationFutureProvider =
//     FutureProvider.family<ActivityLocation?, String>((ref, id) {
//   final activityCommentListRepo = ref.watch(activityLocationRepoProvider);
//   return activityCommentListRepo.fetch(activityLocationID: id);
// });

final activityLocationStreamProvider =
    StreamProvider.family<ActivityLocation?, String>((ref, id) {
  final activityCommentListRepo = ref.read(activityLocationRepoProvider);
  return activityCommentListRepo.watch(activityLocationID: id);
});

// final activityLocationListProvider = Provider<List<ActivityLocation>>((ref) {
//   final activityCommentListRepo = ref.watch(activityLocationRepoProvider);
//   return activityCommentListRepo.getList();
// });

// final activityLocationListFutureProvider =
//     FutureProvider.autoDispose<List<ActivityLocation>>((ref) {
//   final activityCommentListRepo = ref.watch(activityLocationRepoProvider);
//   return activityCommentListRepo.fetchList();
// });

final activityLocationListStreamProvider =
    StreamProvider.autoDispose<List<ActivityLocation>>((ref) {
  final activityCommentListRepo = ref.read(activityLocationRepoProvider);
  return activityCommentListRepo.watchList();
});