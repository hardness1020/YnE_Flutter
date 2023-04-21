import 'package:flutter/material.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

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

class ChatroomCard extends ConsumerWidget {
  const ChatroomCard({super.key, required this.user, this.onPressed});
  final BackendUser? user;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const chatroomCardKey = Key('chatroom_card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      key: chatroomCardKey,
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            // margin: const EdgeInsets.only(left: 10.0),
            child: user?.userHeadShotLink != null
                ? ClipOval(
                    child: CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                              child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3.0,
                                  )),
                            ),
                        imageUrl: user!.userHeadShotLink!,
                        // imageUrl: 'https://picsum.photos/250?image=9',
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill),
                  )
                : const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/woman.jpg"),
                  ),
          ),
          Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(user?.name ?? "Username not found",
                            style: TextStyle(
                                color: bluegrey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text("一小時前",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                gapH4,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Hello! blablablablabla",
                            style: TextStyle(
                                color: bluegrey,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                    const SizedBox(
                        width: 15,
                        child: Icon(Icons.circle, color: Colors.red, size: 14)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
