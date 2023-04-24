import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/activity/data/django/jg_activity_repo.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

void main() {
  group("django activity repo", () {
    kUseFakeRepos = false;
    final repo = DjangoActivityRepo();

    test('watch activity', () {
      final setActivity = Activity(
        id: "1",
        title: "test 1",
        description: "test 1",
        host: BackendUser(id: "1", name: "test backend user 1"),
        location: ActivityLocation(
          id: "1",
        ),
        categories: [
          ActivityCategory(id: "1", name: "test activity category 1"),
        ],
      );
      repo.set(activity: setActivity);
      final watchActivity = repo.watch(activityID: "1");
      expect(watchActivity.first, isNotNull);
    });

    test('watch activity list', () {
      final setActivity = Activity(
        id: "1",
        title: "test 1",
        description: "test 1",
        host: BackendUser(id: "1", name: "test backend user 1"),
        location: ActivityLocation(
          id: "1",
        ),
        categories: [
          ActivityCategory(id: "1", name: "test activity category 1"),
        ],
      );
      repo.set(activity: setActivity);
      final watchActivityList = repo.watchList();
      expect(watchActivityList.first, isNotNull);
    });

    test("set get activity ", () async {
      final setActivity = Activity(
        id: "1",
        title: "test 1",
        description: "test 1",
        host: BackendUser(id: "1", name: "test backend user 1"),
        location: ActivityLocation(
          id: "1",
        ),
        categories: [
          ActivityCategory(id: "1", name: "test activity category 1"),
        ],
      );
      repo.set(activity: setActivity);
      final getActivity = repo.get(activityID: "1");
      expect(getActivity, setActivity);
    });

    test("set get activity list", () async {
      final setActivityList = [
        Activity(
          id: "1",
          title: "test 1",
          description: "test 1",
          host: BackendUser(id: "1", name: "test backend user 1"),
          location: ActivityLocation(
            id: "1",
          ),
          categories: [
            ActivityCategory(id: "1", name: "test activity category 1"),
          ],
        ),
        Activity(
          id: "2",
          title: "test 2",
          description: "test 2",
          host: BackendUser(id: "2", name: "test backend user 2"),
          location: ActivityLocation(
            id: "2",
          ),
          categories: [
            ActivityCategory(id: "2", name: "test activity category 2"),
          ],
        ),
      ];
      repo.setList(activityList: setActivityList);
      final getActivityList = repo.getList();
      expect(getActivityList, setActivityList);
    });

    test("set unset activity", () async {});

    test("fetch activity", () async {
      final fetchedActivity = await repo.fetch(activityID: "1");
      expect(fetchedActivity!.id, "1");
    });
    test("fetch activity list", () async {
      final fetchedActivityList = await repo.fetchList(page: "1");
      expect(fetchedActivityList, isNotEmpty);
      expect(fetchedActivityList!.length, isNotNull);
    });

    test("create activity", () async {
      final activityToCreate = Activity(
        host: BackendUser(id: "1", name: "test backend user 1"),
        startDate: "2021-01-01",
        endDate: "2021-01-02",
        title: "test 1",
        location: ActivityLocation(
          id: "1",
        ),
        categories: [
          ActivityCategory(id: "1", name: "test activity category 1"),
        ],
      );

      final createdActivity = await repo.create(
        userID: '1',
        activity: activityToCreate,
      );
      expect(createdActivity, isNotNull);
      expect(createdActivity!.id, isNotNull);
    });

    test("delete activity", () async {
      final activityToCreate = Activity(
        host: BackendUser(id: "1", name: "test backend user 1"),
        startDate: "2021-01-01",
        endDate: "2021-01-02",
        title: "test 1",
        location: ActivityLocation(
          id: "1",
        ),
        categories: [
          ActivityCategory(id: "1", name: "test activity category 1"),
        ],
      );
      final createdActivity = await repo.create(
        userID: '1',
        activity: activityToCreate,
      );
      repo.delete(activityID: '1', userID: '1');
    });

    test("update activity", () async {
      final activityToUpdate = await repo.fetch(activityID: '2');
      activityToUpdate!.categories!
          .add(ActivityCategory(id: '1', name: 'test activity category 1'));
      final updatedSctivity =
          await repo.update(activity: activityToUpdate, userID: '2');
      expect(updatedSctivity, isNotNull);
      expect(updatedSctivity!.categories!.length, 2);
    });

    test("toggle like activity", () async {
      final activityToUpdate = await repo.fetch(activityID: '2');
      final toggledActivity = await repo.userToggleLikeActivity(
        activityID: '2',
        userID: '2',
      );
      expect(toggledActivity, isNotNull);
      expect(toggledActivity.isLiked!, !activityToUpdate!.isLiked!);
    });

    test("toggle join activity", () async {
      final activityToUpdate = await repo.fetch(activityID: '2');
      final toggledActivity = await repo.userToggleJoinActivity(
        activityID: '2',
        userID: '2',
      );
      expect(toggledActivity, isNotNull);
      expect(toggledActivity.isJoined!, !activityToUpdate!.isJoined!);
    });

    test("update activity thumbnail", () async {
      final activityToUpdate = await repo.fetch(activityID: '2');
      final oldId = activityToUpdate!.id;
      final oldLink = activityToUpdate.backGroundLink;
      final updatedActivity = await repo.updateActivityBackground(
        activityID: '2',
        userID: '2',
        background: File('assets/test/test_image.jpg'),
      );
      expect(updatedActivity, isNotNull);
      expect(updatedActivity!.backGroundLink, equals(oldLink));
      expect(updatedActivity.id, oldId);
    });
  });
}
