import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuple/tuple.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/application/activity_service.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';

void main() {
  kUseFakeRepos = true;
  ActivityService makeActivityService() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container.read(activityServiceProvider);
  }

  group('activity service', () {
    test('getList should return a list', () {
      ActivityService activityService = makeActivityService();
      expect(activityService.getList(), isA<List<Activity>>());
    });
    test('get should return a activty', () {
      ActivityService activityService = makeActivityService();
      expect(activityService.get(activityID: '1'), isA<Activity>());
    });
    test('fetchList should return a list', () async {
      ActivityService activityService = makeActivityService();
      expect(await activityService.fetchList(), isA<List<Activity>>());
    });
    test('fetch should return a activty', () async {
      ActivityService activityService = makeActivityService();
      expect(await activityService.fetch(activityID: '1'), isA<Activity>());
    });
    test('create should return a activty', () async {
      ActivityService activityService = makeActivityService();
      await activityService.create(activity: Activity(id: '6'), userID: '1');
      expect(await activityService.fetch(activityID: '6'), isA<Activity>());
    });
    test('update should return a activty', () async {
      ActivityService activityService = makeActivityService();
      await activityService.update(activity: Activity(id: '6'), userID: '1');
      expect(await activityService.fetch(activityID: '6'), isA<Activity>());
    });
    test('delete should make activity llist less', () async {
      ActivityService activityService = makeActivityService();
      final initialList =
          await activityService.fetchList().then((value) => (value));
      int initialLength = initialList == null ? 0 : initialList.length;
      await activityService.delete(activityID: '1', userID: '1');
      await activityService
          .fetchList()
          .then((value) => expect(value!.length, initialLength - 1));
    });
    test('activityLikedByUser should add user to liked list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await activityService.fetch(activityID: '1');
      int initialLength = initialActivity!.likedUsers == null
          ? 0
          : initialActivity.likedUsers!.length;
      await activityService.activityLikedByUser(activityID: '1', userID: '3');
      final likedActivity = await activityService.fetch(activityID: '1');
      expect(likedActivity!.likedUsers!.length, equals(initialLength + 1));
    });
    test('activityUnlikedByUser should remove user from liked list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await activityService.fetch(activityID: '1');
      int initialLength = initialActivity!.likedUsers == null
          ? 0
          : initialActivity.likedUsers!.length;
      await activityService.activityLikedByUser(activityID: '1', userID: '3');
      final updatedActivity = await activityService.fetch(activityID: '1');
      expect(updatedActivity!.likedUsers!.length, equals(initialLength + 1));
      await activityService.activityUnlikedByUser(activityID: '1', userID: '3');
      final likedActivity = await activityService.fetch(activityID: '1');
      expect(likedActivity!.likedUsers!.length, equals(initialLength));
    });
    test('activityJoinedByUser should add user to joined list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await activityService.fetch(activityID: '1');
      int initialLength = initialActivity!.participants == null
          ? 0
          : initialActivity.participants!.length;
      await activityService.activityJoinedByUser(activityID: '1', userID: '3');
      final joinedActivity = await activityService.fetch(activityID: '1');
      expect(joinedActivity!.participants!.length, equals(initialLength + 1));
    });
    test('activityUnjoinedByUser should remove user from joined list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await activityService.fetch(activityID: '1');
      int initialLength = initialActivity!.participants == null
          ? 0
          : initialActivity.participants!.length;
      await activityService.activityJoinedByUser(activityID: '1', userID: '3');
      final updatedActivity = await activityService.fetch(activityID: '1');
      expect(updatedActivity!.participants!.length, equals(initialLength + 1));
      await activityService.activityUnjoinedByUser(activityID: '1', userID: '3');
      final joinedActivity = await activityService.fetch(activityID: '1');
      expect(joinedActivity!.participants!.length, equals(initialLength));
    });
    test('fetchListByCategory should return a list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.create(
          activity: Activity(
              id: '6',
              categories: [ActivityCategory(id: '1', name: 'Catergory 1')]),
          userID: '1');
      expect(
          await activityService.fetchListByCategory(
              page: '1', activityCategoryID: '1'),
          isA<Tuple2<String, List<Activity>?>>());
    });
    test('fetchListByLocation should return a list', () async {
      ActivityService activityService = makeActivityService();
      await activityService.create(
          activity: Activity(
              id: '6', location: ActivityLocation(id: '1', name: 'Location i')),
          userID: '1');
      expect(
          await activityService.fetchListByLocation(
              page: '1', activityLocationID: '1'),
          isA<Tuple2<String, List<Activity>?>>());
    });
  });
}
