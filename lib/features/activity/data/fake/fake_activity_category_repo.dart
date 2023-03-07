import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/utils/delay.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';
import 'package:yne_flutter/constants/test_data.dart';


class FakeActivityCategoryRepo extends IntfActivityCategoryRepo {
  final bool addDelay;

  FakeActivityCategoryRepo({this.addDelay = true});
  
  @override
  Future<List<ActivityCategory>> list() async {
    await delay(addDelay);
    return fakeActivityCategoryList;
  }
  
  @override
  Future<ActivityCategory> retrieve({required String id}) async {
    await delay(addDelay);
    return fakeActivityCategoryList.firstWhere((element) => element.id == id);
  }
}
 