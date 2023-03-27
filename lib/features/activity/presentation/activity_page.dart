import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/application/activity_category_service.dart';
import 'package:yne_flutter/features/activity/presentation/activity_tab_page.dart';

class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final activityCategoryList = ref.watch(activityCategoryListFutureProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/YnE.png",
          width: 90,
        ),
      ),
      body: AsyncValueWidget<List<ActivityCategory>?>(
        value: activityCategoryList,
        data: (catalogList) => DefaultTabController(
          length: catalogList!.length,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(49),
              child: AppBar(
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: TabBar(
                  indicatorWeight: 3,
                  tabs: catalogList.map((e) => Tab(text: e.name!)).toList(),
                  isScrollable: true,
                  indicatorColor: Theme.of(context).primaryColor,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.p16,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.p16,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
            body: TabBarView(
              children: catalogList.map(
                (e) {
                  return ActivityTabPage(categoryID: e.id!);
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
