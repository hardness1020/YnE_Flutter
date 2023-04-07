import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/constants/test_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yne_flutter/features/activity/presentation/list/activity_card.dart';
import 'package:yne_flutter/features/backend_user/application/backend_user_service.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_hobby.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_job.dart';
import 'package:yne_flutter/features/backend_user/presentation/user_activity_card.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
// import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
// import 'package:yne_flutter/features/shared/presentation/widgets/responsive_center.dart';
import 'package:yne_flutter/routing/app_router.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage>
    with TickerProviderStateMixin {
  // final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // final activityCategoryList = ref.watch(activityListFutureProvider);
    // BackendUserJob job0 = BackendUserJob(id: '0', name: 'rocket builder');
    // BackendUserJob job1 = BackendUserJob(id: '1', name: 'rocker');
    // BackendUserHobby hobby0 =
    //     BackendUserHobby(id: '0', name: 'rocket building');
    // BackendUserHobby hobby1 = BackendUserHobby(id: '1', name: 'origami');
    // final user = BackendUser(
    //     id: '0',
    //     name: 'Amy',
    //     gender: 'F',
    //     intro: '1 2 3',
    //     jobs: [job0, job1],
    //     hobbies: [hobby0, hobby1],
    //     hostedActivities: [fakeActivityList[3], fakeActivityList[5]]);
    AsyncValue<BackendUser?> userValue =
        ref.watch(randomNextBackendUserFutureProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: AsyncValueWidget<BackendUser?>(
        value: userValue,
        data: (user) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Column(
                    children: [
                      // user pic
                      Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            stops: [0, 0.65, 1.0],
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0),
                              Color.fromRGBO(255, 255, 255, 0.3),
                              Color.fromRGBO(255, 255, 255, 1.0),
                            ],
                          ),
                        ),
                        child: const Image(
                            image: AssetImage("assets/images/ski.jpg"),
                            // width: 360,
                            height: 350,
                            fit: BoxFit.cover),
                      ),
                      gapH12,
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user!.name ?? "Somebody", style: displayMid),
                              gapH8,
                              if (user.jobs != null) ...[
                                Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8.0, // space between adjacent tags
                                    runSpacing:
                                        4.0, // space between rows of tags
                                    children: user.jobs!.map((e) {
                                      return Chip(
                                        label: Text(e.name!),
                                        backgroundColor: const Color.fromARGB(
                                            159, 181, 148, 112),
                                      );
                                    }).toList()),
                                gapH16,
                              ],
                              // hosted activity

                              if (user.hostedActivities != null) ...[
                                Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8.0, // space between adjacent tags
                                    runSpacing:
                                        12.0, // space between rows of tags
                                    children: user.hostedActivities!.map((e) {
                                      return UserActivityWidget(
                                        activity: e,
                                        onPressed: () => context.goNamed(
                                          AppRoute.activityDetail.name,
                                          params: {'id': e.id!},
                                        ),
                                      );
                                    }).toList()),
                                gapH8,
                              ],
                              gapH16,
                              Text("我的興趣",
                                  style: TextStyle(
                                      color: bluegrey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                              if (user.hobbies != null) ...[
                                Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8.0, // space between adjacent tags
                                    runSpacing:
                                        4.0, // space between rows of tags
                                    children: user.hobbies!.map((e) {
                                      return Chip(
                                        label: Text(e.name!),
                                        backgroundColor: Colors.grey[300],
                                      );
                                    }).toList()),
                              ],
                              gapH16,
                              Text("關於我",
                                  style: TextStyle(
                                      color: bluegrey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                              Text(user.intro ?? '',
                                  style: TextStyle(
                                      color: bluegrey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5)),
                              gapH32,
                              gapH64
                            ]),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 35,
                    left: 16,
                    child: Image.asset(
                      "assets/images/YnE.png",
                      width: 90,
                    ),
                  ),
                  Positioned(
                    top: 28,
                    right: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        iconColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const FaIcon(FontAwesomeIcons.bell,
                          color: Color.fromRGBO(55, 71, 79, 1), size: 30),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 105,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: 'nextBtn',
            onPressed: () {
              final nextUser = ref.watch(randomNextBackendUserFutureProvider);
              print(nextUser.value!.name!);
            },
            backgroundColor: const Color.fromARGB(255, 225, 216, 217),
            child: const Icon(Icons.arrow_forward_ios, size: 30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
