import 'package:flutter/material.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:cached_network_image/cached_network_image.dart';

Color bluegrey = const Color.fromARGB(255, 39, 42, 80);
TextStyle bodyTiny =
    TextStyle(color: bluegrey, fontSize: 10, fontWeight: FontWeight.w400);
TextStyle bodySmall =
    TextStyle(color: bluegrey, fontSize: 12, fontWeight: FontWeight.w300);
TextStyle bodyMidLight =
    TextStyle(color: bluegrey, fontSize: 14, fontWeight: FontWeight.w400);
TextStyle bodyMid =
    TextStyle(color: bluegrey, fontSize: 14, fontWeight: FontWeight.w600);
TextStyle bodyLarge =
    TextStyle(color: bluegrey, fontSize: 16, fontWeight: FontWeight.normal);
TextStyle titleSmall =
    TextStyle(color: bluegrey, fontSize: 20, fontWeight: FontWeight.normal);
TextStyle titleMid =
    TextStyle(color: bluegrey, fontSize: 22, fontWeight: FontWeight.normal);
TextStyle titleLarge =
    TextStyle(color: bluegrey, fontSize: 24, fontWeight: FontWeight.w500);
TextStyle displaySmall =
    TextStyle(color: bluegrey, fontSize: 28, fontWeight: FontWeight.w600);
TextStyle displayMid =
    TextStyle(color: bluegrey, fontSize: 32, fontWeight: FontWeight.w600);

class ActivityCard extends ConsumerWidget {
  const ActivityCard({super.key, required this.activity, this.onPressed});
  final Activity activity;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const activityCardKey = Key('activity-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.8,
            blurRadius: 1.2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Card(
        child: InkWell(
          key: activityCardKey,
          onTap: onPressed,
          child: Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      activity.backGroundLink != null
                          ? CachedNetworkImage(
                              placeholder: (context, url) => const Center(
                                    child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3.0,
                                        )),
                                  ),
                              imageUrl: activity.backGroundLink!,
                              width: 360,
                              height: 150,
                              fit: BoxFit.cover)
                          : const Image(
                              image: AssetImage("assets/images/ski.jpg"),
                              width: 360,
                              height: 150,
                              fit: BoxFit.cover),

                      // activity photo
                      gapH8,
                      Container(
                        margin: const EdgeInsets.only(left: 115),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          activity.host?.name ?? "Anonymous",
                          style: TextStyle(
                              color: Colors.brown[600],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      gapH8,
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(activity.title ?? "Title not found",
                                  style: titleLarge),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 3),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Text(
                                  activity.categories![0].name ??
                                      "Unknown category",
                                  style: titleSmall),
                            ),
                          ) // only first
                        ],
                      ),
                      gapH12,
                      Row(
                        children: [
                          Container(
                            width: 105,
                            margin: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined),
                                Column(
                                  children: [
                                    Text(" ${activity.endDate ?? "XXXX/XX/XX"}",
                                        style: bodySmall),
                                    Text("~${activity.endDate ?? "XXXX/XX/XX"}",
                                        style: bodySmall),
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
                                      style: bodyMid),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Row(
                              children: [
                                const Icon(Icons.comment_rounded),
                                gapW4,
                                Text(
                                    (activity.comments != null)
                                        ? activity.comments!.length.toString()
                                        : '0',
                                    style: bodyMid),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 55,
                            child: Row(
                              children: [
                                const Icon(Icons.favorite_border),
                                gapW4,
                                Text(
                                    (activity.likedUsers != null)
                                        ? activity.likedUsers!.length.toString()
                                        : '0',
                                    style: bodyMid),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                // for User Photo
                margin: const EdgeInsets.only(left: 25.0, top: 110),
                child: activity.host?.userHeadShotLink != null
                    ? ClipOval(
                        child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                  child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3.0,
                                      )),
                                ),
                            imageUrl: activity.host!.userHeadShotLink!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill),
                      )
                    : const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/woman.jpg"),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
