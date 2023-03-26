import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/activity/data/fake/fake_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';

void main() {
  kUseFakeRepos = true;
  group('FakeActivityRepo', () {
    test('getList should return a non-null list of activities', () {
      final repo = FakeActivityRepo();
      final activities = repo.getList();
      expect(activities, isNotNull);
      expect(activities!.isNotEmpty, isTrue);
      expect(activities, fakeActivityList);
    });

    test('get should return an activity with a given ID', () {
      final repo = FakeActivityRepo();
      final activity = repo.get(activityID: '1');
      expect(activity, isNotNull);
      expect(activity!.id, equals('1'));
    });

    test('setList should add activities to the list', () async {
      final repo = FakeActivityRepo();
      final initialLength = repo.getList()!.length;
      final activitiesToAdd = [
        Activity(
          id: '6',
          title: 'Hiking in the mountains',
          description: 'A beautiful hike in the mountains',
          startDate: "2021-01-06",
          endDate: "2021-01-07",
          location: ActivityLocation(id: '2', name: 'Mountains'),
          categories: [ActivityCategory(id: '2', name: 'Outdoors')],
        ),
      ];
      await repo.setList(activityList: activitiesToAdd);
      List<Activity> newList = await repo.fetchList().then((value) => value!);
      expect(newList.length, equals(initialLength + activitiesToAdd.length));
    });

    test('set should add an activity to the list', () async {
      final repo = FakeActivityRepo();
      final initialLength = repo.getList()!.length;
      final activityToAdd = Activity(
        id: '6',
        title: 'Hiking in the mountains',
        description: 'A beautiful hike in the mountains',
        startDate: "2021-01-06",
        endDate: "2021-01-07",
        location: ActivityLocation(id: '2', name: 'Category 2'),
        categories: [ActivityCategory(id: '2', name: 'Category 2')],
      );
      await repo.set(activity: activityToAdd);
      List<Activity> newList = await repo.fetchList().then((value) => value!);
      expect(newList.length, equals(initialLength + 1));
    });

    test('fetchList should return a future containing the list of activities',
        () async {
      final repo = FakeActivityRepo();
      final activitiesFuture = repo.fetchList();
      expect(activitiesFuture, completes);
      final activities = await activitiesFuture;
      expect(activities, isNotNull);
      expect(activities!.isNotEmpty, isTrue);
    });

    test('fetch should return a future containing an activity with a given ID',
        () async {
      final repo = FakeActivityRepo();
      final activityFuture = repo.fetch(activityID: '1');
      expect(activityFuture, completes);
      final activity = await activityFuture;
      expect(activity, isNotNull);
      expect(activity!.id, equals('1'));
    });

    test('watchList should return a stream of the list of activities', () {
      final repo = FakeActivityRepo();
      final activitiesStream = repo.watchList();
      expect(activitiesStream, emits(isNotNull));
    });

    test('watch should return a stream of an activity with a given ID', () {
      final repo = FakeActivityRepo();
      final activityStream = repo.watch(activityID: '1');
      expect(activityStream, emits(isNotNull));
    });

    test('create should add an activity to the list', () async {
      final repo = FakeActivityRepo();
      final initialLength = repo.getList()!.length;
      final activityToAdd = Activity(
        id: '6',
        title: 'Hiking in the mountains',
        description: 'A beautiful hike in the mountains',
        startDate: "2021-01-06",
        endDate: "2021-01-07",
        location: ActivityLocation(id: '2', name: 'Mountains'),
        categories: [ActivityCategory(id: '2', name: 'Outdoors')],
      );
      await repo.create(activity: activityToAdd, userID: '1');
      final fetchedList = await repo.fetchList();
      expect(fetchedList!.length, equals(initialLength + 1));
    });

    test('update should update an existing activity or add a new one',
        () async {
      final repo = FakeActivityRepo();
      final initialLength = repo.getList()!.length;
      final activityToEdit = Activity(
        id: '2',
        title: 'Hiking in the mountains',
        description: 'A beautiful hike in the mountains',
        startDate: "2021-01-06",
        endDate: "2021-01-07",
        location: ActivityLocation(id: '2', name: 'Mountains'),
        categories: [ActivityCategory(id: '2', name: 'Outdoors')],
      );
      await repo.update(activity: activityToEdit, userID: '2');
      final fetchedList = await repo.fetchList();
      expect(fetchedList!.length, equals(initialLength));
      final editedActivity = await repo.fetch(activityID: '2');
      expect(editedActivity, isNotNull);
      expect(editedActivity!.title, equals('Hiking in the mountains'));
    });

    test('delete should remove an activity with a given ID', () async {
      final repo = FakeActivityRepo();
      final initialLength = repo.getList()!.length;
      await repo.delete(activityID: '1', userID: '1');
      final fetchedList = await repo.fetchList();
      expect(fetchedList!.length, equals(initialLength - 1));
    });

    test(
        'activityLikedByUser should add a user to the list of liked users for an activity',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await repo.fetch(activityID: '1');
      int initialLength = initialActivity!.likedUsers == null
          ? 0
          : initialActivity.likedUsers!.length;
      await repo.activityLikedByUser(activityID: '1', userID: '3');
      final likedActivity = await repo.fetch(activityID: '1');
      expect(likedActivity!.likedUsers!.length, equals(initialLength + 1));
    });

    test(
        'activityUnlikedByUser should remove a user from the list of liked users for an activity',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await repo.fetch(activityID: '1');
      int initialLength = initialActivity!.likedUsers == null
          ? 0
          : initialActivity.likedUsers!.length;
      await repo.activityLikedByUser(activityID: '1', userID: '3');
      final updatedActivity = await repo.fetch(activityID: '1');
      expect(updatedActivity!.likedUsers!.length, equals(initialLength + 1));
      await repo.activityUnlikedByUser(activityID: '1', userID: '3');
      final unlikedActivity = await repo.fetch(activityID: '1');
      expect(unlikedActivity!.likedUsers!.length, initialLength);
    });

    test(
        'activityJoinedByUser should add a user to the list of participants for an activity',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await repo.fetch(activityID: '1');
      int initialLength = initialActivity!.participants == null
          ? 0
          : initialActivity.participants!.length;
      await repo.activityJoinedByUser(activityID: '1', userID: '3');
      final updatedActivity = await repo.fetch(activityID: '1');
      expect(updatedActivity!.participants!.length, equals(initialLength + 1));
    });

    test(
        'activityUnjoinedByUser should remove a user from the list of participants for an activity',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final initialActivity = await repo.fetch(activityID: '1');
      int initialLength = initialActivity!.participants == null
          ? 0
          : initialActivity.participants!.length;
      await repo.activityJoinedByUser(activityID: '1', userID: '3');
      final updatedActivity = await repo.fetch(activityID: '1');
      expect(updatedActivity!.participants!.length, equals(initialLength + 1));
      await repo.activityUnjoinedByUser(activityID: '1', userID: '3');
      final unjoinedActivity = await repo.fetch(activityID: '1');
      expect(unjoinedActivity!.participants!.length, initialLength);
    });

    test(
        'fetchListByCategory should return a tuple containing the list of activities filtered by a category ID',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final tupleFuture =
          repo.fetchListByCategory(page: '1', activityCategoryID: '1');
      expect(tupleFuture, completes);
      final tuple = await tupleFuture;
      expect(tuple, isNotNull);
      int expectedLength = 0;
      for (int i = 0; i < fakeActivityList.length; i++) {
        if (fakeActivityList[i].categories == null) {
          continue;
        }
        for (int j = 0; j < fakeActivityList[i].categories!.length; j++) {
          if (fakeActivityList[i].categories![j].id == '1') {
            ++expectedLength;
          }
        }
      }
      expect(tuple!.item2!.length, equals(expectedLength));
    });

    test(
        'fetchListByLocation should return a tuple containing the list of activities filtered by a location ID',
        () async {
      final repo = FakeActivityRepo();
      await repo.update(
          activity: Activity(
              id: "1",
              categories: [
                ActivityCategory(id: "1", name: "Category 1"),
              ],
              location: ActivityLocation(id: "1", name: "Location 1")),
          userID: "1");
      final tupleFuture =
          repo.fetchListByLocation(page: '1', activityLocationID: '1');
      expect(tupleFuture, completes);
      final tuple = await tupleFuture;
      expect(tuple, isNotNull);
      int expectedLength = 0;
      for (int i = 0; i < fakeActivityList.length; i++) {
        if (fakeActivityList[i].location == null) {
          continue;
        }
        if (fakeActivityList[i].location!.id == '1') {
          ++expectedLength;
        }
      }
      expect(tuple!.item2!.length, equals(expectedLength));
    });
  });
}
