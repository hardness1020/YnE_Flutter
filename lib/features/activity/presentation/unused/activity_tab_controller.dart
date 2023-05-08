import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/features/activity/application/activity_service.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';

class ActivityTabController extends StateNotifier<AsyncValue<void>> {
  ActivityTabController({required this.activityService})
      : super(const AsyncData(null));
  final ActivityService activityService;

  Future<void> fetchActivityFromCategoryID(String categoryID, int pageKey,
      PagingController<int, Activity> pagingController) async {
    try {
      final Tuple2<String, List<Activity>?>? response =
          await activityService.fetchListByCategory(
        page: pageKey.toString(),
        activityCategoryID: categoryID,
      );
      if (response!.item1 == pageKey.toString()) {
        pagingController.appendLastPage(response.item2 ?? <Activity>[]);
      } else {
        pagingController.appendPage(response.item2 ?? <Activity>[], pageKey + 1);
      }
      state = const AsyncValue.data(null);
    } catch (e) {
      if (mounted) {
        state = AsyncValue.error(e, StackTrace.current);
        pagingController.error = e;
      }
    }
  }
  
  Future<void> fetchActivity(int pageKey,
      PagingController<int, Activity> pagingController) async {
    try {
      final Tuple2<String, List<Activity>?> response =
          await activityService.fetchList(
        page: pageKey.toString()
      );
      if (response!.item1 == pageKey.toString()) {
        pagingController.appendLastPage(response.item2 ?? <Activity>[]);
      } else {
        pagingController.appendPage(
            response.item2 ?? <Activity>[], pageKey + 1);
      }
      state = const AsyncValue.data(null);
    } catch (e) {
      if (mounted) {
        state = AsyncValue.error(e, StackTrace.current);
        pagingController.error = e;
      }
    }
  }

}

final activityTabControllerProvider =
    StateNotifierProvider.autoDispose<ActivityTabController, AsyncValue<void>>(
        (ref) {
  final activityService = ref.watch(activityServiceProvider);
  return ActivityTabController(
    activityService: activityService,
  );
});
