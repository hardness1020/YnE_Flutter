import 'package:tuple/tuple.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/constants/test_data.dart';

class FakeActivityRepo extends IntfActivityRepo {
  final bool addDelay;

  FakeActivityRepo({this.addDelay = true});

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
  Future<List<Activity>> list() async {
    await delay(addDelay);
    return fakeActivityList;
  }

  @override
  Future<Activity> retrieve({required String id}) async {
    await delay(addDelay);
    return fakeActivityList.firstWhere((element) => element.id == id);
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
  Future<Tuple2<String, List<Activity>>> listFromCategory(
      {required String page, required String categoryId}) async {
    await delay(addDelay);
    return Tuple2('1', fakeActivityList);
    
  }
}
