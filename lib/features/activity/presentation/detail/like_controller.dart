import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';

import 'package:yne_flutter/features/activity/presentation/detail/like_state.dart';
import 'package:yne_flutter/features/auth/application/auth_service.dart';

// final LikeNotifierProvider =
//     StateNotifierProvider<MyStateNotifier, String>((ref) {
//   final streamProvider = ref.watch(myStreamProvider(id));
//   final initialData = streamProvider.when(
//       data: (data) => data,
//       loading: () => null,
//       error: (error, stackTrace) => null);
//   return MyStateNotifier(initialData);
// });

class LikeController extends StateNotifier<LikeState> {
  LikeController({required this.activityService}) : super(LikeState());
  final ActivityService activityService;
  // String activityId;

  Future<bool> toggleLike(Tuple3<String, String, String> pageAndIDs) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => activityService.userToggleLikeActivity(
          activityID: pageAndIDs.item2,
          userID: pageAndIDs.item3),
    );
    state = state.copyWith(value: value);
    return value.hasError == false;
  }
}

final likeControllerProvider =
    StateNotifierProvider.autoDispose<LikeController, LikeState>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  return LikeController(activityService: activityService);
});
