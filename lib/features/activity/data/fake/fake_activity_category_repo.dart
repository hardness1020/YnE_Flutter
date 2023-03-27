import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';

import 'package:yne_flutter/features/activity/data/interface/intf_activity_category_repo.dart';
import 'package:yne_flutter/utils/delay.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeActivityCategoryRepo extends IntfActivityCategoryRepo {
  final InMemoryStore<List<ActivityCategory>?> _activityCategories =
      InMemoryStore<List<ActivityCategory>?>(
          List.from(fakeActivityCategoryList));

  final bool addDelay;

  FakeActivityCategoryRepo({this.addDelay = true});

  @override
  ActivityCategory? get({required String activityCategoryID}) {
    return _get(
        activityCategoryList: _activityCategories.value,
        activityCategoryID: activityCategoryID);
  }

  @override
  List<ActivityCategory>? getList() {
    return _activityCategories.value;
  }

  @override
  Future<void> set({required ActivityCategory activityCategory}) async {
    await delay(addDelay);
    fakeActivityCategoryList.add(activityCategory);
  }

  @override
  Future<void> setList(
      {required List<ActivityCategory> activityCategoryList}) async {
    await delay(addDelay);
    fakeActivityCategoryList.addAll(activityCategoryList);
  }

  @override
  Future<ActivityCategory?> fetch({required String activityCategoryID}) async {
    final futureFakeActivityCategoryList =
        Future.value(fakeActivityCategoryList).then((value) => value);
    final fetchedFakeActivityCategoryList =
        await futureFakeActivityCategoryList;
    for (int i = 0; i < fetchedFakeActivityCategoryList.length; i++) {
      if (fetchedFakeActivityCategoryList[i].id == activityCategoryID) {
        return fetchedFakeActivityCategoryList[i];
      }
    }
    throw Exception('ActivityCategory not found');
  }

  @override
  Future<List<ActivityCategory>?> fetchList() async {
    final futureFakeActivityCategoryList =
        Future.value(fakeActivityCategoryList).then((value) => value);
    final fetchedFakeActivityCategoryList =
        await futureFakeActivityCategoryList;
    return fetchedFakeActivityCategoryList;
  }

  @override
  Stream<ActivityCategory?> watch({required String activityCategoryID}) {
    return watchList().map((activityCategoryList) => _get(
        activityCategoryList: activityCategoryList,
        activityCategoryID: activityCategoryID));
  }

  @override
  Stream<List<ActivityCategory>?> watchList() {
    return _activityCategories.stream;
  }

  @override
  Future<void> create(
      {required ActivityCategory activityCategory,
      required String userID}) async {
    await delay(addDelay);
    fakeActivityCategoryList.add(activityCategory);
  }

  @override
  Future<void> delete(
      {required String activityCategoryID, required String userID}) async {
    final List<ActivityCategory>? activityCategories = await fetchList();
    final int index = activityCategories!.indexWhere((p) => p.id == activityCategoryID);
    if (index == -1) {
      // not found
      print("[Activity ID Undefined]: Activity deletion failed");
    } else {
      // else, delete activity categroy
      activityCategories.removeAt(index);
    }
    fakeActivityCategoryList = activityCategories;
  }

  static ActivityCategory? _get(
      {required List<ActivityCategory>? activityCategoryList,
      required String activityCategoryID}) {
    return activityCategoryList!.firstWhere(
        (activityCategory) => activityCategory.id == activityCategoryID);
  }
}
