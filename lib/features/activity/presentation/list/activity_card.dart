import 'package:flutter/material.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';

Color bluegrey = const Color.fromARGB(255, 39, 42, 80);
TextStyle bodySmall =
    TextStyle(color: bluegrey, fontSize: 12, fontWeight: FontWeight.w300);
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

/// Used to show a single product inside a card.
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
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(80))),
        child: InkWell(
          key: activityCardKey,
          onTap: onPressed,
          child: Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      const Image(
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
                          // style: Theme.of(context).textTheme.titleLarge,
                          style: TextStyle(
                              color: Colors.brown[600],
                              // color: Color.fromARGB(255, 20, 39, 48)
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
                              // style:
                              //     Theme.of(context).textTheme.titleLarge),
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
                                    Text(
                                        " ${activity.endDate ?? "XXXX/XX/XX"}",
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodySmall),
                                        style: bodySmall),
                                    Text(
                                        "~${activity.endDate ?? "XXXX/XX/XX"}",
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
                                        ? activity.likedUsers!.length
                                            .toString()
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
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/woman.jpg"),
                ),
              ),
              // Container(
              //   // for User Photo
              //   margin: const EdgeInsets.only(left: 8.0, top: 14),
              //   width: 5.0, height: 5.0,
              //   child: const Image(
              //       image: AssetImage("assets/images/woman.jpg"), height: 10),
              // )
            ],
          ),
        ),
      ),
    );
    // return Card(
    //   child: InkWell(
    //     key: activityCardKey,
    //     onTap: onPressed,
    //     child: Padding(
    //       padding: const EdgeInsets.all(Sizes.p16),
    //       child: Stack(
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               // CustomImage(imageUrl: activity.imageUrl),
    //               // gapH8,
    //               const Divider(),
    //               // gapH8,
    //               Text(activity.title ?? "Title not found",
    //                   style: Theme.of(context).textTheme.headlineSmall),
    //               // if (product.numRatings >= 1) ...[
    //               //   gapH8,
    //               //   ProductAverageRating(product: product),
    //               // ],
    //               // gapH24,
    //               // Text(priceFormatted,
    //               //     style: Theme.of(context).textTheme.headlineSmall),
    //               Expanded(
    //                 child: Text(activity.host?.name ?? "Anonymous",
    //                     style: Theme.of(context).textTheme.titleMedium),
    //               ),
    //               gapH4,
    //               Text(
    //                   '${activity.startDate ?? "XXXX/XX/XX"}~${activity.endDate ?? "XXXX/XX/XX"}',
    //                   style: Theme.of(context).textTheme.titleSmall),
    //               gapH8,
    //               Text(activity.description ?? "......Description......",
    //                   style: Theme.of(context).textTheme.bodyMedium),
    //               gapH4,
    //               // Text(
    //               //   product.availableQuantity <= 0
    //               //       ? 'Out of Stock'.hardcoded
    //               //       : 'Quantity: ${product.availableQuantity}'.hardcoded,
    //               //   style: Theme.of(context).textTheme.bodySmall,
    //               // )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
