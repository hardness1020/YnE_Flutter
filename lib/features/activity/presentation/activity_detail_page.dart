import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';

class ActivityDetailPage extends ConsumerStatefulWidget {
  // const ActivityDetailPage({Key? key}) : super(key: key);
  const ActivityDetailPage({super.key, required this.activityId});
  final String activityId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActivityDetailPageState();
}

class _ActivityDetailPageState extends ConsumerState<ActivityDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final activityValue = ref.watch(activityFutureProvider(widget.activityId));
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
          title: Image.asset(
            "assets/images/YnE.png",
            width: 90,
          ),
        ),
        body: AsyncValueWidget<Activity?>(
          value: activityValue,
          data: (activity) => //DefaultTabController(),
              ListTile(
                  title: Text("Title:" + activity!.title!),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
        )
    );
  }
}
