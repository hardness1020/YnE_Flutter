import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/user/domain/user.dart';

List<ActivityCategory> fakeActivityCategoryList = [
  ActivityCategory(id: '1', name: 'Category 1'),
  ActivityCategory(id: '2', name: 'Category 2'),
  ActivityCategory(id: '3', name: 'Category 3'),
  ActivityCategory(id: '4', name: 'Category 4'),
  ActivityCategory(id: '5', name: 'Category 5'),
];

List<ActivityLocation> fakeLocationList = [
  ActivityLocation(id: '0', name: 'Taipei'),
  ActivityLocation(id: '1', name: 'Location 1'),
  ActivityLocation(id: '2', name: 'Location 2'),
  ActivityLocation(id: '3', name: 'Location 3'),
  ActivityLocation(id: '4', name: 'Location 4'),
];

List<ActivityComment> fakeActivityCommentList = [
  ActivityComment(
    id: '1',
    content: 'Comment 1',
    date: '2021-02-01',
  ),
  ActivityComment(
    id: '2',
    content: 'Comment 2',
    date: '2021-02-02',
  ),
  ActivityComment(
    id: '3',
    content: 'Comment 3',
    date: '2021-02-03',
  ),
  ActivityComment(
    id: '4',
    content: 'Comment 4',
    date: '2021-02-04',
  ),
  ActivityComment(
    id: '5',
    content: 'Comment 5',
    date: '2021-02-05',
  ),
];

List<User> fakeUserList = [
  User(id: '0', name: 'Amy', gender: 'F', intro: '1 2 3'),
  User(id: '1', name: 'Bob', gender: 'M', intro: '2 3 4'),
  User(id: '2', name: 'Cindy', gender: 'F', intro: '3 4 5'),
  User(id: '3', name: 'Daddy', gender: 'M', intro: '4 5 6'),
  User(id: '4', name: 'Elle', gender: 'F', intro: '5 6 7'),
];

List<Activity> fakeActivityList = [
  Activity(
      id: '1', title: 'Activity 1', categories: [fakeActivityCategoryList[0]]),
  Activity(
      id: '2', title: 'Activity 2', categories: [fakeActivityCategoryList[1]]),
  Activity(
      id: '3',
      title: 'Baking',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUserList[0],
      startDate: '2023/4/1',
      endDate: '2023/5/2',
      description: 'Yay!',
      location: fakeLocationList[0]),
  Activity(
      id: '4',
      title: 'Rock Band',
      categories: [fakeActivityCategoryList[1]],
      host: fakeUserList[0],
      startDate: '2023/2/1',
      description: 'Yo!'),
  Activity(
      id: '5',
      title: 'Skiing',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUserList[1],
      startDate: '2023/4/1',
      endDate: '2023/4/3',
      description: 'Weeeee!'),
  Activity(
      id: '6',
      title: 'Rocket Building',
      categories: [fakeActivityCategoryList[0]],
      host: fakeUserList[1],
      startDate: '2023/4/1',
      endDate: '2025/12/25',
      description: 'Ahhhh!')
];