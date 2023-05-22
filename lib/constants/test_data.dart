import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

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

BackendUser fakeHeroUser = BackendUser(
    id: '0', name: 'hero', gender: 'F', introduction: 'I am a cute kangaroo');

List<BackendUser> fakeOtherUserList = [
  BackendUser(
    id: '1',
    name: 'Amy',
    gender: 'F',
    introduction: 'Not that cute a kangaroo',
    hostActivities: [
      fakeActivityList[0],
      fakeActivityList[1],
      fakeActivityList[2]
    ],
    userBigPicLink: "https://picsum.photos/id/91/1000/500",
    userHeadShotLink: "https://picsum.photos/id/103/1000/500",
  ),
  BackendUser(id: '2', name: 'Bob', gender: 'M', introduction: '2 3 4'),
  BackendUser(id: '3', name: 'Cindy', gender: 'F', introduction: '3 4 5'),
  BackendUser(id: '4', name: 'Daddy', gender: 'M', introduction: '4 5 6'),
  BackendUser(id: '5', name: 'Elle', gender: 'F', introduction: '5 6 7'),
];

List<Activity> fakeActivityList = [
  Activity(
      id: '1',
      title: 'Activity 1',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      host: BackendUser(
        id: '1',
        name: 'Amy',
        gender: 'F',
        introduction: '1 2 3',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      backGroundLink: "https://picsum.photos/id/101/1000/500"),
  Activity(
      id: '2',
      title: 'Activity 2',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      host: BackendUser(
        id: '1',
        name: 'Amy',
        gender: 'F',
        introduction: '1 2 3',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      backGroundLink: "https://picsum.photos/id/102/1000/500"),
  Activity(
      id: '3',
      title: 'Baking',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      host: BackendUser(
        id: '1',
        name: 'Amy',
        gender: 'F',
        introduction: '1 2 3',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      startDate: '2023-04-01',
      endDate: '2023-05-02',
      description: 'Yay!',
      location: fakeLocationList[0]),
  Activity(
      id: '4',
      title: 'Rock Band',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[0],
      startDate: '2023-02-01',
      description: 'Yo!'),
  Activity(
      id: '5',
      title: 'Skiing',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-04-01',
      endDate: '2023-04-03',
      description: 'Weeeee!'),
  Activity(
      id: '6',
      title: 'Rocket Building',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-04-01',
      endDate: '2025-12-25',
      description:
          'Ahhhh! weee! Do you want to build a rocket and go to the moon?\n lalalalala Let\'s get started! weeeeeee~~~'),
  Activity(
      id: '7',
      title: 'sky diving',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[0],
      startDate: '2023-02-01',
      description: 'white bear is so cute'),
  Activity(
      id: '8',
      title: 'swimming',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-04-01',
      endDate: '2023-04-30',
      description: 'Weeeee! I love swimming'),
  Activity(
      id: '9',
      title: 'cutie pie',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-10-01',
      endDate: '2028-12-25',
      description:
          'Ahhhh! is so cute! Do you want to build a rocket and go to the moon?\n lalalalala Let\'s get started! weeeeeee~~~'),
  Activity(
      id: '10',
      title: 'helicopter tour',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-02-01',
      description: 'white bear is so cute'),
  Activity(
      id: '11',
      title: 'Whitewater Rafting',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-05-15',
      description:
          'Experience the thrill of the rapids on this exciting whitewater rafting adventure. Navigate through the rushing waters and enjoy the stunning views along the way.'),
  Activity(
      id: '12',
      title: 'Hiking and Camping Trip',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-07-01',
      description:
          'Escape to the great outdoors and join us on a hiking and camping trip. Explore beautiful trails, set up camp, and enjoy the natural beauty of the wilderness.'),
  Activity(
      id: '13',
      title: 'Wine Tasting Tour',
      categories: [fakeActivityCategoryList[2]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-08-20',
      description:
          'Indulge in the finest wines on this exclusive wine tasting tour. Sample a variety of wines and learn about the history and production of each one.'),
  Activity(
      id: '14',
      title: 'Cooking Class',
      categories: [fakeActivityCategoryList[3]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-10-05',
      description:
          'Learn to cook like a pro on this fun and interactive cooking class. Discover new recipes and techniques, and enjoy a delicious meal at the end of the class.'),
  Activity(
      id: '15',
      title: 'Salsa Dancing Class',
      categories: [fakeActivityCategoryList[4]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-11-01',
      endDate: '2023-12-01',
      description:
          'Learn the basics of salsa dancing in this fun and interactive class.'),
  Activity(
      id: '16',
      title: 'Painting Class',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-05-30',
      description:
          'Learn the basics of painting in this fun and interactive class.'),
  Activity(
      id: '17',
      title: 'Yoga Class',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of yoga in this fun and interactive class.'),
  Activity(
      id: '18',
      title: 'Baking Class',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-10-01',
      endDate: '2024-03-30',
      description:
          'Learn the basics of baking in this fun and interactive class.'),
  Activity(
      id: '19',
      title: 'Skiing',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of skiing in this fun and interactive class.'),
  Activity(
      id: '20',
      title: 'Rock Climbing',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of rock climbing in this fun and interactive class.'),
];

List<ChatRoom> fakeChatroomList = [
  ChatRoom(
    id: '1',
    heroRead: false,
    chatPartner: fakeOtherUserList[0],
    messages: [
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: false,
          content: 'And you?',
          time: '2021-05-01 12:22:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'I am fine, thank you.',
          time: '2021-05-01 12:15:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: 'Hello, how are you?',
          time: '2021-05-01 12:13:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'And you?',
          time: '2021-05-01 12:12:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'I am fine, thank you.',
          time: '2021-05-01 12:11:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: 'Hello, how are you?',
          time: '2021-05-01 12:09:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'And you?',
          time: '2021-05-01 12:06:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'I am fine, thank you.',
          time: '2021-05-01 12:05:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: 'Hello, how are you?',
          time: '2021-05-01 12:03:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'And you?',
          time: '2021-05-01 12:02:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'I am fine, thank you.',
          time: '2021-05-01 12:01:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: 'Hello, how are you?',
          time: '2021-05-01 12:00:00',
          type: "sent"),
    ],
  ),
  ChatRoom(
    id: '2',
    heroRead: true,
    chatPartner: fakeOtherUserList[1],
    messages: [
      Message(
          chatroomID: '2',
          senderUserID: '2',
          heroRead: false,
          content: 'How dare you!',
          time: '2021-05-01 13:02',
          type: "received"),
      Message(
          chatroomID: '2',
          senderUserID: '0',
          heroRead: true,
          content: 'No, you are NOT',
          time: '2021-05-01 13:01',
          type: "sent"),
      Message(
          chatroomID: '2',
          senderUserID: '2',
          heroRead: true,
          content: 'I am so cute!',
          time: '2021-05-01 13:00',
          type: "received"),
    ],
  ),
];