import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

class Activity {
  String? id;
  String? startDate;
  String? endDate;
  String? title;
  String? description;
  BackendUser? host;
  ActivityLocation? location;
  List<ActivityCategory>? categories;
  List<ActivityComment>? comments;
  List<BackendUser>? likedUsers;
  List<BackendUser>? participants;

  Activity(
      {this.id,
      this.startDate,
      this.endDate,
      this.title,
      this.description,
      this.host,
      this.location,
      this.categories,
      this.comments,
      this.likedUsers,
      this.participants});

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
      json['categories'].forEach((v) {
        categories!.add(ActivityCategory.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <ActivityComment>[];
      json['comments'].forEach((v) {
        comments!.add(ActivityComment.fromJson(v));
      });
    }
    if (json['liked_users'] != null) {
      likedUsers = <BackendUser>[];
      json['liked_users'].forEach((v) {
        likedUsers!.add(BackendUser.fromJson(v));
      });
    }
    if (json['participants'] != null) {
      participants = <BackendUser>[];
      json['participants'].forEach((v) {
        participants!.add(BackendUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['title'] = title;
    data['description'] = description;
    data['host'] = host!.toJson();
    data['location'] = location!.toJson();
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (likedUsers != null) {
      data['liked_users'] = likedUsers!.map((v) => v.toJson()).toList();
    }
    if (participants != null) {
      data['participants'] = participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
