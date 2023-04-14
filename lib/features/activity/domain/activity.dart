import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/backend_user/application/backend_user_service.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

class Activity {
  String? id;
  String? startDate;
  String? endDate;
  String? title;
  ActivityLocation? location;
  String? participantsNum;
  // short
  List<ActivityCategory>? categories;
  String? commentsNum;
  String? likesNum;
  BackendUser? host;
  // medium
  String? description;
  List<BackendUser>? participants;
  List<BackendUser>? likedUsers;
  List<ActivityComment>? comments;
  bool? isLiked;
  bool? isJoined;
  String? backGroundLink;

  // long

  Activity({
    this.id,
    this.startDate,
    this.endDate,
    this.title,
    this.description,
    this.host,
    this.isLiked,
    this.isJoined,
    this.location,
    this.categories,
    this.comments,
    this.commentsNum,
    this.likedUsers,
    this.likesNum,
    this.participants,
    this.participantsNum,
    this.backGroundLink,

  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    title = json['title'];
    description = json['description'];
    host = BackendUser.fromJson(json['host']);
    location = ActivityLocation.fromJson(json['location']);
    if (json['categories'] != null) {
      categories = <ActivityCategory>[];
      json['categories'].forEach((category) {
        categories!.add(ActivityCategory.fromJson(category));
      });
    }
    if (json['comments'] != null) {
      comments = <ActivityComment>[];
      json['comments'].forEach((comment) {
        comments!.add(ActivityComment.fromJson(comment));
      });
    }
    commentsNum = json['comments_num'];
    if (json['liked_users'] != null) {
      likedUsers = <BackendUser>[];
      json['liked_users'].forEach((backendUser) {
        likedUsers!.add(BackendUser.fromJson(backendUser));
      });
    }
    likesNum = json['likes_num'];
    if (json['participants'] != null) {
      participants = <BackendUser>[];
      json['participants'].forEach((v) {
        participants!.add(BackendUser.fromJson(v));
      });
    }
    participantsNum = json['participants_num'];
  }

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_id'] = host!.id;
      data['start_date'] = startDate;
      data['end_date'] = endDate;
      data['title'] = title;
      if (location != null) {
        data['location_id'] = location!.id;
      }
      data['description'] = description;
      if (categories != null) {
        data['categories_id'] =
            categories!.map((category) => category.id).toList();
      }
      // if (participants != null) {
      //   data['participants'] =
      //       participants!.map((participant) => participant.id).toList();
      // }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
