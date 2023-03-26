import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/user/domain/user.dart';

List<ActivityCategory> fakeActivityCategoryList = [
  ActivityCategory(
    id: '1', name: 'Category 1',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[0].id,
    //       startDate: fakeActivityList[0].startDate,
    //       endDate: fakeActivityList[0].endDate,
    //       title: fakeActivityList[0].title,
    //       description: fakeActivityList[0].description)
    // ]
  ),
  ActivityCategory(
    id: '2', name: 'Category 2',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[1].id,
    //       startDate: fakeActivityList[1].startDate,
    //       endDate: fakeActivityList[1].endDate,
    //       title: fakeActivityList[1].title,
    //       description: fakeActivityList[1].description)
    // ]
  ),
  ActivityCategory(
    id: '3', name: 'Category 3',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[2].id,
    //       startDate: fakeActivityList[2].startDate,
    //       endDate: fakeActivityList[2].endDate,
    //       title: fakeActivityList[2].title,
    //       description: fakeActivityList[2].description)
    // ]
  ),
  ActivityCategory(
    id: '4', name: 'Category 4',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[3].id,
    //       startDate: fakeActivityList[3].startDate,
    //       endDate: fakeActivityList[3].endDate,
    //       title: fakeActivityList[3].title,
    //       description: fakeActivityList[3].description)
    // ]
  ),
  ActivityCategory(
    id: '5', name: 'Category 5',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[4].id,
    //       startDate: fakeActivityList[4].startDate,
    //       endDate: fakeActivityList[4].endDate,
    //       title: fakeActivityList[4].title,
    //       description: fakeActivityList[4].description)
    // ]
  ),
];

List<ActivityLocation> fakeActivityLocationList = [
  ActivityLocation(
    id: '1', name: 'Location 1',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[0].id,
    //       startDate: fakeActivityList[0].startDate,
    //       endDate: fakeActivityList[0].endDate,
    //       title: fakeActivityList[0].title,
    //       description: fakeActivityList[0].description)
    // ]
  ),
  ActivityLocation(
    id: '2', name: 'Location 2',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[1].id,
    //       startDate: fakeActivityList[1].startDate,
    //       endDate: fakeActivityList[1].endDate,
    //       title: fakeActivityList[1].title,
    //       description: fakeActivityList[1].description)
    // ]
  ),
  ActivityLocation(
    id: '3', name: 'Location 3',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[2].id,
    //       startDate: fakeActivityList[2].startDate,
    //       endDate: fakeActivityList[2].endDate,
    //       title: fakeActivityList[2].title,
    //       description: fakeActivityList[2].description)
    // ]
  ),
  ActivityLocation(
    id: '4', name: 'Location 4',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[3].id,
    //       startDate: fakeActivityList[3].startDate,
    //       endDate: fakeActivityList[3].endDate,
    //       title: fakeActivityList[3].title,
    //       description: fakeActivityList[3].description)
    // ]
  ),
  ActivityLocation(
    id: '5', name: 'Location 5',
    // activities: [
    //   Activity(
    //       id: fakeActivityList[4].id,
    //       startDate: fakeActivityList[4].startDate,
    //       endDate: fakeActivityList[4].endDate,
    //       title: fakeActivityList[4].title,
    //       description: fakeActivityList[4].description)
    // ]
  ),
];

List<ActivityComment> fakeActivityCommentList = [
  ActivityComment(
    id: '1',
    content: 'Comment 1',
    date: '2021-02-01',
    // belongedActivity: Activity(
    // id: fakeActivityList[4].id,
    // startDate: fakeActivityList[4].startDate,
    // endDate: fakeActivityList[4].endDate,
    // title: fakeActivityList[4].title,
    // description: fakeActivityList[4].description),
    // author: User(
    // id: fakeUserList[0].id,
    // name: fakeUserList[4].name,
    // gender: fakeUserList[0].gender,
    // intro: fakeUserList[0].intro)
  ),
  ActivityComment(
    id: '2',
    content: 'Comment 2',
    date: '2021-02-02',
    // belongedActivity: Activity(
    // id: fakeActivityList[1].id,
    // startDate: fakeActivityList[1].startDate,
    // endDate: fakeActivityList[1].endDate,
    // title: fakeActivityList[1].title,
    // description: fakeActivityList[1].description),
    // author: User(
    // id: fakeUserList[1].id,
    // name: fakeUserList[1].name,
    // gender: fakeUserList[1].gender,
    // intro: fakeUserList[1].intro)
  ),
  ActivityComment(
    id: '3',
    content: 'Comment 3',
    date: '2021-02-03',
    // belongedActivity: Activity(
    // id: fakeActivityList[2].id,
    // startDate: fakeActivityList[2].startDate,
    // endDate: fakeActivityList[2].endDate,
    // title: fakeActivityList[2].title,
    // description: fakeActivityList[2].description),
    // author: User(
    // id: fakeUserList[2].id,
    // name: fakeUserList[2].name,
    // gender: fakeUserList[2].gender,
    // intro: fakeUserList[2].intro)
  ),
  ActivityComment(
    id: '4',
    content: 'Comment 4',
    date: '2021-02-04',
    // belongedActivity: Activity(
    // id: fakeActivityList[3].id,
    // startDate: fakeActivityList[3].startDate,
    // endDate: fakeActivityList[3].endDate,
    // title: fakeActivityList[3].title,
    // description: fakeActivityList[3].description),
    // author: User(
    // id: fakeUserList[3].id,
    // name: fakeUserList[3].name,
    // gender: fakeUserList[3].gender,
    // intro: fakeUserList[3].intro)
  ),
  ActivityComment(
    id: '5',
    content: 'Comment 5',
    date: '2021-02-05',
    // belongedActivity: Activity(
    // id: fakeActivityList[4].id,
    // startDate: fakeActivityList[4].startDate,
    // endDate: fakeActivityList[4].endDate,
    // title: fakeActivityList[4].title,
    // description: fakeActivityList[4].description),
    // author: User(
    // id: fakeUserList[4].id,
    // name: fakeUserList[4].name,
    // gender: fakeUserList[4].gender,
    // intro: fakeUserList[4].intro)
  ),
];

List<User> fakeUserList = [
  User(
    id: '1',
    name: 'User 1',
    gender: 'boy',
    intro: 'I am happy 1',
    // hostedActivities: [
    // Activity(
    // id: fakeActivityList[0].id,
    // startDate: fakeActivityList[0].startDate,
    // endDate: fakeActivityList[0].endDate,
    // title: fakeActivityList[0].title,
    // description: fakeActivityList[0].description)
    // ],
    // joinedActivities: [
    // Activity(
    // id: fakeActivityList[0].id,
    // startDate: fakeActivityList[0].startDate,
    // endDate: fakeActivityList[0].endDate,
    // title: fakeActivityList[0].title,
    // description: fakeActivityList[0].description)
    // ],
    // likedActivities: [
    // Activity(
    // id: fakeActivityList[0].id,
    // startDate: fakeActivityList[0].startDate,
    // endDate: fakeActivityList[0].endDate,
    // title: fakeActivityList[0].title,
    // description: fakeActivityList[0].description)
    // ],
  ),
  User(
    id: '2',
    name: 'User 2',
    gender: 'girl',
    intro: 'I am happy 2',
    // hostedActivities: [
    // Activity(
    // id: fakeActivityList[1].id,
    // startDate: fakeActivityList[1].startDate,
    // endDate: fakeActivityList[1].endDate,
    // title: fakeActivityList[1].title,
    // description: fakeActivityList[1].description)
    // ],
    // joinedActivities: [
    // Activity(
    // id: fakeActivityList[1].id,
    // startDate: fakeActivityList[1].startDate,
    // endDate: fakeActivityList[1].endDate,
    // title: fakeActivityList[1].title,
    // description: fakeActivityList[1].description)
    // ],
    // likedActivities: [
    // Activity(
    // id: fakeActivityList[1].id,
    // startDate: fakeActivityList[1].startDate,
    // endDate: fakeActivityList[1].endDate,
    // title: fakeActivityList[1].title,
    // description: fakeActivityList[1].description)
    // ],
  ),
  User(
    id: '3',
    name: 'User 3',
    gender: 'boy',
    intro: 'I am happy 3',
    // hostedActivities: [
    //   Activity(
    //       id: fakeActivityList[2].id,
    //       startDate: fakeActivityList[2].startDate,
    //       endDate: fakeActivityList[2].endDate,
    //       title: fakeActivityList[2].title,
    //       description: fakeActivityList[2].description)
    // ],
    // joinedActivities: [
    //   Activity(
    //       id: fakeActivityList[2].id,
    //       startDate: fakeActivityList[2].startDate,
    //       endDate: fakeActivityList[2].endDate,
    //       title: fakeActivityList[2].title,
    //       description: fakeActivityList[2].description)
    // ],
    // likedActivities: [
    //   Activity(
    //       id: fakeActivityList[2].id,
    //       startDate: fakeActivityList[2].startDate,
    //       endDate: fakeActivityList[2].endDate,
    //       title: fakeActivityList[2].title,
    //       description: fakeActivityList[2].description)
    // ],
  ),
  User(
    id: '4',
    name: 'User 4',
    gender: 'girl',
    intro: 'I am happy 4',
    // hostedActivities: [
    // Activity(
    // id: fakeActivityList[3].id,
    // startDate: fakeActivityList[3].startDate,
    // endDate: fakeActivityList[3].endDate,
    // title: fakeActivityList[3].title,
    // description: fakeActivityList[3].description)
    // ],
    // joinedActivities: [
    // Activity(
    // id: fakeActivityList[3].id,
    // startDate: fakeActivityList[3].startDate,
    // endDate: fakeActivityList[3].endDate,
    // title: fakeActivityList[3].title,
    // description: fakeActivityList[3].description)
    // ],
    // likedActivities: [
    // Activity(
    // id: fakeActivityList[3].id,
    // startDate: fakeActivityList[3].startDate,
    // endDate: fakeActivityList[3].endDate,
    // title: fakeActivityList[3].title,
    // description: fakeActivityList[3].description)
    // ],
  ),
  User(
    id: '5',
    name: 'User 5',
    gender: 'boy',
    intro: 'I am happy 5',
    // hostedActivities: [
    //   Activity(
    //       id: fakeActivityList[4].id,
    //       startDate: fakeActivityList[4].startDate,
    //       endDate: fakeActivityList[4].endDate,
    //       title: fakeActivityList[4].title,
    //       description: fakeActivityList[4].description)
    // ],
    // joinedActivities: [
    //   Activity(
    //       id: fakeActivityList[4].id,
    //       startDate: fakeActivityList[4].startDate,
    //       endDate: fakeActivityList[4].endDate,
    //       title: fakeActivityList[4].title,
    //       description: fakeActivityList[4].description)
    // ],
    // likedActivities: [
    //   Activity(
    //       id: fakeActivityList[4].id,
    //       startDate: fakeActivityList[4].startDate,
    //       endDate: fakeActivityList[4].endDate,
    //       title: fakeActivityList[4].title,
    //       description: fakeActivityList[4].description)
    // ],
  )
];

List<Activity> fakeActivityList = [
  Activity(
    id: '1',
    startDate: '2021-01-01',
    endDate: '2021-01-02',
    title: 'Activity Title 1',
    description: 'Activity Description 1',
    // host: User(
    // id: fakeUserList[0].id,
    // name: fakeUserList[0].name,
    // gender: fakeUserList[0].gender,
    // intro: fakeUserList[0].intro),
    // location: ActivityLocation(
    // id: fakeActivityLocationList[0].id,
    // name: fakeActivityLocationList[0].name),
    // categories: [
    // ActivityCategory(
    // id: fakeActivityCategoryList[0].id,
    // name: fakeActivityCategoryList[0].name)
    // ],
    // comments: [
    // ActivityComment(
    // id: fakeActivityCommentList[0].id,
    // content: fakeActivityCommentList[0].content,
    // date: fakeActivityCommentList[0].date,
    // )
    // ],
    // likedUsers: [
    // User(
    // id: fakeUserList[0].id,
    // name: fakeUserList[0].name,
    // gender: fakeUserList[0].gender,
    // intro: fakeUserList[0].intro)
    // ],
    // participants: [
    // User(
    // id: fakeUserList[0].id,
    // name: fakeUserList[0].name,
    // gender: fakeUserList[0].gender,
    // intro: fakeUserList[0].intro)
    // ],
  ),
  Activity(
    id: '2',
    startDate: '2021-01-02',
    endDate: '2021-01-03',
    title: 'Activity Title 2',
    description: 'Activity Description 2',
    // host: User(
    //     id: fakeUserList[1].id,
    //     name: fakeUserList[1].name,
    //     gender: fakeUserList[1].gender,
    //     intro: fakeUserList[1].intro),
    // location: ActivityLocation(
    //     id: fakeActivityLocationList[1].id,
    //     name: fakeActivityLocationList[1].name),
    // categories: [
    //   ActivityCategory(
    //       id: fakeActivityCategoryList[1].id,
    //       name: fakeActivityCategoryList[1].name)
    // ],
    // comments: [
    //   ActivityComment(
    //     id: fakeActivityCommentList[1].id,
    //     content: fakeActivityCommentList[1].content,
    //     date: fakeActivityCommentList[1].date,
    //   )
    // ],
    // likedUsers: [
    //   User(
    //       id: fakeUserList[1].id,
    //       name: fakeUserList[1].name,
    //       gender: fakeUserList[1].gender,
    //       intro: fakeUserList[1].intro)
    // ],
    // participants: [
    //   User(
    //       id: fakeUserList[1].id,
    //       name: fakeUserList[1].name,
    //       gender: fakeUserList[1].gender,
    //       intro: fakeUserList[1].intro)
    // ],
  ),
  Activity(
    id: '3',
    startDate: '2021-01-03',
    endDate: '2021-01-04',
    title: 'Activity Title 3',
    description: 'Activity Description 3',
    // host: User(
    //     id: fakeUserList[2].id,
    //     name: fakeUserList[2].name,
    //     gender: fakeUserList[2].gender,
    //     intro: fakeUserList[2].intro),
    // location: ActivityLocation(
    //     id: fakeActivityLocationList[2].id,
    //     name: fakeActivityLocationList[2].name),
    // categories: [
    //   ActivityCategory(
    //       id: fakeActivityCategoryList[2].id,
    //       name: fakeActivityCategoryList[2].name)
    // ],
    // comments: [
    //   ActivityComment(
    //     id: fakeActivityCommentList[2].id,
    //     content: fakeActivityCommentList[2].content,
    //     date: fakeActivityCommentList[2].date,
    //   )
    // ],
    // likedUsers: [
    //   User(
    //       id: fakeUserList[2].id,
    //       name: fakeUserList[2].name,
    //       gender: fakeUserList[2].gender,
    //       intro: fakeUserList[2].intro)
    // ],
    // participants: [
    //   User(
    //       id: fakeUserList[2].id,
    //       name: fakeUserList[2].name,
    //       gender: fakeUserList[2].gender,
    //       intro: fakeUserList[2].intro)
    // ],
  ),
  Activity(
    id: '4',
    startDate: '2021-01-04',
    endDate: '2021-01-05',
    title: 'Activity Title 4',
    description: 'Activity Description 4',
    // host: User(
    //     id: fakeUserList[3].id,
    //     name: fakeUserList[3].name,
    //     gender: fakeUserList[3].gender,
    //     intro: fakeUserList[3].intro),
    // location: ActivityLocation(
    //     id: fakeActivityLocationList[3].id,
    //     name: fakeActivityLocationList[3].name),
    // categories: [
    //   ActivityCategory(
    //       id: fakeActivityCategoryList[3].id,
    //       name: fakeActivityCategoryList[3].name)
    // ],
    // comments: [
    //   ActivityComment(
    //     id: fakeActivityCommentList[3].id,
    //     content: fakeActivityCommentList[3].content,
    //     date: fakeActivityCommentList[3].date,
    //   )
    // ],
    // likedUsers: [
    //   User(
    //       id: fakeUserList[3].id,
    //       name: fakeUserList[3].name,
    //       gender: fakeUserList[3].gender,
    //       intro: fakeUserList[3].intro)
    // ],
    // participants: [
    //   User(
    //       id: fakeUserList[3].id,
    //       name: fakeUserList[3].name,
    //       gender: fakeUserList[3].gender,
    //       intro: fakeUserList[3].intro)
    // ],
  ),
  Activity(
    id: '5',
    startDate: '2021-01-05',
    endDate: '2021-01-06',
    title: 'Activity Title 5',
    description: 'Activity Description 5',
    // host: User(
    //     id: fakeUserList[4].id,
    //     name: fakeUserList[4].name,
    //     gender: fakeUserList[4].gender,
    //     intro: fakeUserList[4].intro),
    // location: ActivityLocation(
    //     id: fakeActivityLocationList[4].id,
    //     name: fakeActivityLocationList[4].name),
    // categories: [
    //   ActivityCategory(
    //       id: fakeActivityCategoryList[4].id,
    //       name: fakeActivityCategoryList[4].name)
    // ],
    // comments: [
    //   ActivityComment(
    //     id: fakeActivityCommentList[4].id,
    //     content: fakeActivityCommentList[4].content,
    //     date: fakeActivityCommentList[4].date,
    //   )
    // ],
    // likedUsers: [
    //   User(
    //       id: fakeUserList[4].id,
    //       name: fakeUserList[4].name,
    //       gender: fakeUserList[4].gender,
    //       intro: fakeUserList[4].intro)
    // ],
    // participants: [
    //   User(
    //       id: fakeUserList[4].id,
    //       name: fakeUserList[4].name,
    //       gender: fakeUserList[4].gender,
    //       intro: fakeUserList[4].intro)
    // ],
  ),
];
