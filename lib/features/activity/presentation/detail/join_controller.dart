import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';
import 'package:yne_flutter/features/activity/presentation/detail/join_state.dart';

class JoinController extends StateNotifier<JoinState> {
  JoinController({required this.activityService}) : super(JoinState());
  final ActivityService activityService;

  Future<bool> toggleJoin(Tuple3<String, String, String> pageAndIDs) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => activityService.userToggleJoinActivity( activityID: pageAndIDs.item2, userID: pageAndIDs.item3),
    );
    state = state.copyWith(value: value);
    return value.hasError == false;
  }
}

final joinControllerProvider =
    StateNotifierProvider.autoDispose<JoinController, JoinState>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  return JoinController(activityService: activityService);
});
