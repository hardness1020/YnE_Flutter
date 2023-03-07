import 'package:yne_flutter/api/api.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class JgActivityCategoryRepo extends IntfActivityCategoryRepo {
  final bool addDelay;

  JgActivityCategoryRepo({this.addDelay = false});

  @override
  Future<List<ActivityCategory>> list() async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.activityCategoryList[0],
        path: YNEApi.activityCategoryList[1],
      );
      return (responseData['results'] as List)
          .map((e) => ActivityCategory.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<ActivityCategory> retrieve({required String id}) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }
}
