import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/user/domain/user_hobby.dart';
import 'package:yne_flutter/features/user/domain/user_job.dart';

class User {
  String? id;
  String? name;
  String? gender;
  String? intro;
  List<UserJob>? jobs;
  List<UserHobby>? hobbies;
  List<Activity>? hostedActivities;
  List<Activity>? joinedActivities;
  List<Activity>? likedActivities;

  User(
      {this.id,
      this.name,
      this.gender,
      this.intro,
      this.jobs,
      this.hobbies,
      this.hostedActivities,
      this.joinedActivities,
      this.likedActivities});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    intro = json['intro'];
    if (json['jobs'] != null) {
      jobs = <UserJob>[];
      json['jobs'].forEach((v) {
        jobs!.add(UserJob.fromJson(v));
      });
    }
    if (json['hobbies'] != null) {
      hobbies = <UserHobby>[];
      json['hobbies'].forEach((v) {
        hobbies!.add(UserHobby.fromJson(v));
      });
    }
    if (json['hosted_activities'] != null) {
      hostedActivities = <Activity>[];
      json['hosted_activities'].forEach((v) {
        hostedActivities!.add(Activity.fromJson(v));
      });
    }
    if (json['joined_activities'] != null) {
      joinedActivities = <Activity>[];
      json['joined_activities'].forEach((v) {
        joinedActivities!.add(Activity.fromJson(v));
      });
    }
    if (json['liked_activities'] != null) {
      likedActivities = <Activity>[];
      json['liked_activities'].forEach((v) {
        likedActivities!.add(Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['intro'] = intro;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    if (hobbies != null) {
      data['hobbies'] = hobbies!.map((v) => v.toJson()).toList();
    }
    if (hostedActivities != null) {
      data['hosted_activities'] = hostedActivities!.map((v) => v.toJson()).toList();
    }
    if (joinedActivities != null) {
      data['joined_activities'] = joinedActivities!.map((v) => v.toJson()).toList();
    }
    if (likedActivities != null) {
      data['liked_activities'] = likedActivities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
