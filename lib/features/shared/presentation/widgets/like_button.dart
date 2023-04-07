import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/shared/presentation/like/like_controller.dart';
import 'package:yne_flutter/features/shared/presentation/like/like_state.dart';

class LikeButton extends ConsumerWidget {
  const LikeButton({
    super.key,
    required this.activity,
  });
  final Activity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String activityId = activity.id!;
    Tuple3<String, String, String> pageAndIDs =
        Tuple3<String, String, String>('1', activityId, '1');
    final status = ref.watch(activityStreamProvider(activityId));
    final stateLike = ref.watch(likeControllerProvider(activityId));
    return SizedBox(
      width: 45,
      height: 45,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: stateLike.isLoading
              ? null
              : () => _toggleLike(stateLike, pageAndIDs, ref),
          backgroundColor: Color.fromARGB(255, 246, 156, 164),
          child: stateLike.isLoading
              ? const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.0,
                  ),
                )
              // : status.value!.isLiked!
                : activity.isLiked!
                  ? const Icon(Icons.favorite, size: 38)
                  : const Icon(Icons.favorite_border, size: 38),
        ),
      ),
    ); // Hello world
  }

  Future<void> _toggleLike(LikeState state,
      Tuple3<String, String, String> pageAndIDs, WidgetRef ref) async {
    final controller = ref.read(likeControllerProvider(activity.id!).notifier);
    final success = await controller.toggleLike(pageAndIDs);
    if (!success) print('Like Error\n');
  }
}
