import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';
import 'package:yne_flutter/features/shared/presentation/like/like_state.dart';

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
  LikeController({required this.activityService, required this.activityId}) : super(LikeState());
  final ActivityService activityService;
  String activityId;

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
// Provider.family<Activity?, String>((ref, id)
    // StateNotifierProvider.autoDispose<LikeController, LikeState>((ref) {
  StateNotifierProvider.family<LikeController, LikeState, String>((ref, activityId) {
  final activityService = ref.watch(activityServiceProvider);
  return LikeController(activityService: activityService, activityId: activityId);
});
