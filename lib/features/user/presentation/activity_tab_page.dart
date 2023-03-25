import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:go_router/go_router.dart';

import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/presentation/activity_tab_controller.dart';
import 'package:yne_flutter/routing/app_router.dart';

class ActivityTabPage extends ConsumerStatefulWidget {
  const ActivityTabPage({
    super.key,
    required this.categoryId,
  });
  final String categoryId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActivityTabPageState();
}

class _ActivityTabPageState extends ConsumerState<ActivityTabPage> {
  final PagingController<int, Activity> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      ref
          .read(activityTabControllerProvider.notifier)
          .fetchActivityFromCategoryId(
              widget.categoryId, pageKey, _pagingController);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: PagedListView<int, Activity>(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Activity>(
            itemBuilder: (context, item, index) => ListTile(
              title: Text(item.title!),
              onTap: () {
                context.pushNamed(AppRoute.activityDetail.name,
                    params: {'id': item.id!});
              },
            ),
          ),
        ),
      ),
    );
  }
}
