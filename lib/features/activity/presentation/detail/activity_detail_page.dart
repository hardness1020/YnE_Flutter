import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/presentation/detail/join_controller.dart';
import 'package:yne_flutter/features/activity/presentation/detail/join_state.dart';
import 'package:yne_flutter/features/shared/presentation/like/like_controller.dart';
import 'package:yne_flutter/features/shared/presentation/like/like_state.dart';
import 'package:yne_flutter/features/activity/presentation/list/activity_card.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';

class ActivityDetailPage extends ConsumerStatefulWidget {
  // const ActivityDetailPage({Key? key}) : super(key: key);
  const ActivityDetailPage({super.key, required this.activityId});
  final String activityId;

  @override
  ConsumerState<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends ConsumerState<ActivityDetailPage>
    with TickerProviderStateMixin {
  Future<void> _toggleLike(
      LikeState state, Tuple3<String, String, String> pageAndIDs) async {
    final controller = ref.read(likeControllerProvider(widget.activityId).notifier);
    final success = await controller.toggleLike(pageAndIDs);
    if (!success) print('Like Error\n');
  }

  Future<void> _toggleJoin(
      JoinState state, Tuple3<String, String, String> pageAndIDs) async {
    final controller = ref.read(joinControllerProvider.notifier);
    final success = await controller.toggleJoin(pageAndIDs);
    if (!success) print('Join Error\n');
  }

  @override
  Widget build(BuildContext context) {
    final activityValue = ref.watch(activityFutureProvider(widget.activityId));
    Tuple3<String, String, String> pageAndIDs =
        Tuple3<String, String, String>('1', widget.activityId, '1');
    final status = ref.watch(activityStreamProvider(widget.activityId));
    final stateLike = ref.watch(likeControllerProvider(widget.activityId));
    final stateJoin = ref.watch(joinControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: AsyncValueWidget<Activity?>(
          value: activityValue,
          data: (activity) => Stack(children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              // activity pic
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 2,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      // category
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Text(
                                            activity?.categories![0].name ??
                                                "Unknown category",
                                            style: titleMid), // only first
                                      ),
                                    ),
                                    gapH12,
                                    Text(
                                        // title
                                        activity?.title ?? "Title not found",
                                        style: displaySmall),
                                    gapH4,
                                    Row(
                                      // date + location
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Icon(Icons
                                                    .calendar_today_outlined),
                                                Column(
                                                  children: [
                                                    Text(
                                                        " ${activity?.endDate ?? "XXXX/XX/XX"}",
                                                        style: bodySmall),
                                                    Text(
                                                        "~${activity?.endDate ?? "XXXX/XX/XX"}",
                                                        style: bodySmall),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                  Icons.location_on_outlined),
                                              Flexible(
                                                fit: FlexFit.loose,
                                                child: Text(
                                                    activity?.location?.name ??
                                                        "Somewhere",
                                                    style: bodyLarge),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    gapH8,
                                    // user pic + host name
                                    Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 205, 205),
                                            width: 2.5,
                                          ),
                                          top: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 205, 205),
                                            width: 2.5,
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(
                                                "assets/images/woman.jpg"),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              activity?.host?.name ??
                                                  "Anonymous",
                                              // style: Theme.of(context).textTheme.titleLarge,
                                              style: TextStyle(
                                                  color: Colors.brown[600],
                                                  // color: Color.fromARGB(255, 20, 39, 48)
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    gapH24,
                                    Text(
                                      "介紹",
                                      style: TextStyle(
                                          color: bluegrey,
                                          // color: Color.fromARGB(255, 20, 39, 48)
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      activity?.description ?? ' ',
                                      style: TextStyle(
                                          color: bluegrey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                          height: 2.5),
                                    ),
                                    gapH64,
                                    gapH32
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 40,
                            left: 5,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                iconColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                              ),
                              child: const Icon(Icons.arrow_back_rounded,
                                  size: 40),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 30,
                  left: 40,
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 20, right: 50),
                      backgroundColor: bluegrey,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('留言', style: TextStyle(fontSize: 22)),
                    onPressed: () => comment(context),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 40,
                  width: 170,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: bluegrey,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 60, right: 20),
                          backgroundColor: bluegrey,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: stateJoin.isLoading
                            ? null
                            : () => _toggleJoin(stateJoin, pageAndIDs),
                        child: stateJoin.isLoading
                            ? const SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              )
                            : status.value!.isJoined!
                                ? const Text('取消參加', style: TextStyle(fontSize: 22))
                                : const Text('我想參加',
                                    style: TextStyle(fontSize: 22)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 160,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: FittedBox(
                      child: FloatingActionButton(
                        heroTag: 'likeBtn',
                        onPressed: stateLike.isLoading
                            ? null
                            : () => _toggleLike(stateLike, pageAndIDs),
                        backgroundColor: const Color.fromARGB(255, 241, 55, 71),
                        child: stateLike.isLoading
                            ? const SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              )
                            : status.value!.isLiked!
                                ? const Icon(Icons.favorite, size: 30)
                                : const Icon(Icons.favorite_border, size: 30),
                      ),
                    ),
                  ),
                ),
              ])),
      // floatingActionButton: AsyncValueWidget(value: status, data: data),
      // floatingActionButton: Stack(
      //   children: [
      //     Positioned(
      //       bottom: 15,
      //       left: 40,
      //       width: 170,
      //       height: 40,
      //       child: ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           padding: const EdgeInsets.only(left: 20, right: 50),
      //           backgroundColor: bluegrey,
      //           shape: const StadiumBorder(),
      //         ),
      //         child: const Text('留言', style: TextStyle(fontSize: 22)),
      //         onPressed: () => comment(context),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 15,
      //       right: 40,
      //       width: 170,
      //       height: 40,
      //       child: ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           padding: const EdgeInsets.only(left: 60, right: 20),
      //           backgroundColor: bluegrey,
      //           shape: const StadiumBorder(),
      //         ),
      //         onPressed: () {
      //           // setState(() {
      //           //   _isJoining = !_isJoining;
      //           // });
      //           // if (!_isJoining!) {
      //           //   ref.read(userJoinActivityFutureProvider(ids));
      //           // } else {
      //           //   ref.read(userUnjoinActivityFutureProvider(ids));
      //           // }
      //           if (!activityValue.value!.isJoined!) {
      //             ref.read(userJoinActivityFutureProvider(ids));
      //           } else {
      //             ref.read(userUnjoinActivityFutureProvider(ids));
      //           }
      //         },
      //         child: activityValue.value!.isJoined!

      //             ? const Text('取消參加', style: TextStyle(fontSize: 22))
      //             : const Text('我想參加', style: TextStyle(fontSize: 22)),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: SizedBox(
      //         width: 70,
      //         height: 70,
      //         child: FittedBox(
      //           child: FloatingActionButton(
      //             heroTag: 'likeBtn',
      //             onPressed: () {
      //               // setState(() {
      //               //   _isLiking = !_isLiking;
      //               // });
      //               // like(context, _isLiking);

      //               if (!_isLiking!) {
      //                 ref.read(userLikeActivityFutureProvider(ids));
      //               } else {
      //                 ref.read(userUnlikeActivityFutureProvider(ids));
      //               }
      //             },
      //             backgroundColor: const Color.fromARGB(255, 241, 55, 71),
      //             child: _isLiking!
      //                 ? const Icon(Icons.favorite, size: 30)
      //                 : const Icon(Icons.favorite_border, size: 30),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void comment(BuildContext context) {
  print('leave comment!\n');
}

void join(BuildContext context, bool toJoin) {
  if (toJoin) {
    print('Join Activity!\n');
  } else {
    print('Quit joining...\n');
  }
}
