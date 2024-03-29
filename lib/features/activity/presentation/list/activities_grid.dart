import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/shared/presentation/localization/string_hardcoded.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/presentation/list/activity_card.dart';
import 'package:yne_flutter/routing/app_router.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';

/// A widget that displays the list of products that match the search query.
class ActivitiesGrid extends ConsumerWidget {
  const ActivitiesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final activityListValue = ref.watch(activitiesSearchResultsProvider);
    final activityListFutureValue = ref.watch(activityListFutureProvider('1'));
    return AsyncValueWidget<Tuple2<String, List<Activity>?>>(
      value: activityListFutureValue,
      data: (pageAndActivities) {
        final activities = pageAndActivities.item2;
        return activities!.isEmpty
            ? Center(
                child: Text(
                  'No activities found'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            : ActivitiesLayoutGrid(
                itemCount: activities.length,
                itemBuilder: (_, index) {
                  final activity = activities[index];
                  return ActivityCard(
                      activity: activity,
                      onPressed: () {
                        context.goNamed(AppRoute.activityDetail.name,
                            params: {'id': activity.id!});
                      });
                },
              );
      },
    );
  }
}

/// Grid widget with content-sized items.
/// See: https://codewithandrea.com/articles/flutter-layout-grid-content-sized-items/
class ActivitiesLayoutGrid extends StatelessWidget {
  const ActivitiesLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // use a LayoutBuilder to determine the crossAxisCount
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(1, width ~/ 250);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p24, // equivalent to mainAxisSpacing
        columnGap: Sizes.p24, // equivalent to crossAxisSpacing
        children: [
          // render all the items with automatic child placement
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
