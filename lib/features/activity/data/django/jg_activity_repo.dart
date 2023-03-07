import 'package:tuple/tuple.dart';
import 'package:yne_flutter/api/api.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class JgActivityRepo extends IntfActivityRepo {
  final bool addDelay;

  JgActivityRepo({this.addDelay = false});

  @override
  Future<List<Activity>> list() async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.activityList[0],
        path: YNEApi.activityList[1],
      );
      return (responseData['results'] as List)
          .map((e) => Activity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Activity> create({required Activity activity}) async {
    // TODO: implement create
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<Activity> delete({required String id}) async {
    // TODO: implement delete
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<void> likedByUser({required String id, required String userId}) async {
    // TODO: implement likedByUser
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<Activity> retrieve({required String id}) async {
    // TODO: implement retrieve
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<void> unlikedByUser(
      {required String id, required String userId}) async {
    // TODO: implement unlikedByUser
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<Activity> update({required Activity activity}) async {
    // TODO: implement update
    await delay(addDelay);
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, List<Activity>>> listFromCategory({required String page, required String categoryId}) {
    // TODO: implement listFromCategory
    throw UnimplementedError();
  }
}
