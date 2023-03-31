import 'package:flutter/material.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/presentation/list/activity_card.dart';

class UserActivityWidget extends ConsumerWidget {
  const UserActivityWidget({super.key, required this.activity, this.onPressed});
  final Activity activity;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const userActivityWidgetKey = Key('user-activity-widget');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      key: userActivityWidgetKey,
      onTap: onPressed,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Image(
                    image: AssetImage("assets/images/woman.jpg"),
                    width: 90,
                    height: 90),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(activity.title ?? "Title not found",
                        style: titleLarge),
                  ),
                  gapH8,
                  Row(
                    children: [
                      Container(
                        width: 93,
                        margin: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined),
                            Column(
                              children: [
                                Text(" ${activity.endDate ?? "XXXX/XX/XX"}",
                                    style: bodyTiny),
                                Text("~${activity.endDate ?? "XXXX/XX/XX"}",
                                    style: bodyTiny),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 105,
                        child: Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                  activity.location?.name ?? "Somewhere",
                                  style: bodyMidLight),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Positioned(
              right: 10.0,
              top: 9.0,
              child: Column(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: FittedBox(
                      child: FloatingActionButton(
                        heroTag: UniqueKey(),
                        onPressed: () {
                          // setState(() {
                          //   _isLiking = !_isLiking;
                          // });
                          // like(context, _isLiking);
                          print('press on ${activity.title!}\n');
                          // if (!status.isLiked!) {
                          //   ref.read(userLikeActivityFutureProvider(ids));
                          // } else {
                          //   ref.read(userUnlikeActivityFutureProvider(ids));
                          // }
                        },
                        backgroundColor: Color.fromARGB(255, 246, 156, 164),
                        child: //status.isLiked!
                            // ? const Icon(Icons.favorite, size: 30) :
                            const Icon(Icons.favorite_border, size: 38),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline_outlined,
                        size: 20,
                      ),
                      gapW4,
                      Text(
                          (activity.participants != null)
                              ? activity.participants!.length.toString()
                              : '0',
                          style: bodyMid),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
