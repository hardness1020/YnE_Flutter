import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_hobby.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_job.dart';

class BackendUser {
  String? id;
  String? name;
  String? gender;
  String? intro;
  List<BackendUserJob>? jobs;
  List<BackendUserHobby>? hobbies;
  List<Activity>? hostedActivities;
  List<Activity>? joinedActivities;
  List<Activity>? likedActivities;

  BackendUser(
      {this.id,
      this.name,
      this.gender,
      this.intro,
      this.jobs,
      this.hobbies,
      this.hostedActivities,
      this.joinedActivities,
      this.likedActivities});

  BackendUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    intro = json['intro'];
    if (json['jobs'] != null) {
      jobs = <BackendUserJob>[];
      json['jobs'].forEach((job) {
        jobs!.add(BackendUserJob.fromJson(job));
      });
    }
    if (json['hobbies'] != null) {
      hobbies = <BackendUserHobby>[];
      json['hobbies'].forEach((hobby) {
        hobbies!.add(BackendUserHobby.fromJson(hobby));
      });
    }
    if (json['hosted_activities'] != null) {
      hostedActivities = <Activity>[];
      json['hosted_activities'].forEach((activity) {
        hostedActivities!.add(Activity.fromJson(activity));
      });
    }
    if (json['joined_activities'] != null) {
      joinedActivities = <Activity>[];
      json['joined_activities'].forEach((activity) {
        joinedActivities!.add(Activity.fromJson(activity));
      });
    }
    if (json['liked_activities'] != null) {
      likedActivities = <Activity>[];
      json['liked_activities'].forEach((activity) {
        likedActivities!.add(Activity.fromJson(activity));
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
      data['jobs'] = jobs!.map((job) => job.id).toList();
    }
    if (hobbies != null) {
      data['hobbies'] = hobbies!.map((hobby) => hobby.id).toList();
    }
    if (hostedActivities != null) {
      data['hosted_activities'] =
          hostedActivities!.map((activity) => activity.id).toList();
    }
    if (joinedActivities != null) {
      data['joined_activities'] =
          joinedActivities!.map((activity) => activity.id).toList();
    }
    if (likedActivities != null) {
      data['liked_activities'] =
          likedActivities!.map((activity) => activity.id).toList();
    }
    return data;
  }
}
