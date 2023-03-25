import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/user/domain/user.dart';

final fakeActivityCategoryList = [
  ActivityCategory(id: '1', name: 'Category 1'),
  ActivityCategory(id: '2', name: 'Category 2'),
  ActivityCategory(id: '3', name: 'Category 3'),
  ActivityCategory(id: '4', name: 'Category 4'),
  ActivityCategory(id: '5', name: 'Category 5'),
];

final fakeUser0 = User(id: '0', name: 'Amy', gender: 'F');
final fakeUser1 = User(id: '1', name: 'Bob', gender: 'M');

final fakelocation0 = ActivityLocation(id: '0', name: "Taipei");

final fakeActivityList = [
  Activity(
      id: '1', title: 'Activity 1', categories: [fakeActivityCategoryList[0]]),
  Activity(
      id: '2', title: 'Activity 2', categories: [fakeActivityCategoryList[1]]),
  Activity(
      id: '3',
      title: 'Baking',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUser0,
      startDate: '2023/4/1',
      endDate: '2023/5/2',
      description: 'Yay!',
      location: fakelocation0),
  Activity(
      id: '4',
      title: 'Rock Band',
      categories: [fakeActivityCategoryList[1]],
      host: fakeUser0,
      startDate: '2023/2/1',
      description: 'Yo!'),
  Activity(
      id: '5',
      title: 'Skiing',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUser1,
      startDate: '2023/4/1',
      endDate: '2023/4/3',
      description: 'Weeeee!'),
  Activity(
      id: '6',
      title: 'Rocket Building',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUser0,
      startDate: '2023/4/1',
      endDate: '2025/12/25',
      description: 'Ahhhh!')
];
