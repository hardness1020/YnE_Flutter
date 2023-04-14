import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_hobby.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user_job.dart';

class BackendUser {
  String? id;
  String? name;
  String? gender;
  // short
  List<BackendUserJob>? jobs;
  List<BackendUserHobby>? hobbies;
  List<Activity>? hostActivities;
  String? hostActivitiesNum;
  // medium
  String? introduction;
  String? hobbiesNum;
  List<Activity>? participatingActivities;
  String? participatingActivitiesNum;
  List<Activity>? likedActivities;
  String? likedActivitiesNum;
  List<ActivityComment>? writtenComments;
  String? writtenCommentsNum;
  String? userHeadShotLink;
  String? userBigPicLink;

  // long

  BackendUser(
      {this.id,
      this.name,
      this.gender,
      this.introduction,
      this.hobbiesNum,
      this.jobs,
      this.hobbies,
      this.hostActivities,
      this.hostActivitiesNum,
      this.participatingActivities,
      this.likedActivities,
      this.writtenComments,
      this.writtenCommentsNum,
      this.userHeadShotLink,
      this.userBigPicLink});

  BackendUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
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
    if (json['host_activities'] != null) {
      hostActivities = <Activity>[];
      json['host_activities'].forEach((activity) {
        hostActivities!.add(Activity.fromJson(activity));
      });
    }
    hostActivitiesNum = json['host_activities_num'];

    introduction = json['introduction'];
    if (json['joined_activities'] != null) {
      participatingActivities = <Activity>[];
      json['joined_activities'].forEach((activity) {
        participatingActivities!.add(Activity.fromJson(activity));
      });
    }
    hobbiesNum = json['hobbies_num'];
    if (json['participating_activities'] != null) {
      participatingActivities = <Activity>[];
      json['participating_activities'].forEach((activity) {
        participatingActivities!.add(Activity.fromJson(activity));
      });
    }
    participatingActivitiesNum = json['participating_activities_num'];
    if (json['liked_activities'] != null) {
      likedActivities = <Activity>[];
      json['liked_activities'].forEach((activity) {
        likedActivities!.add(Activity.fromJson(activity));
      });
    }
    likedActivitiesNum = json['liked_activities_num'];
    if (json['written_comments'] != null) {
      writtenComments = <ActivityComment>[];
      json['written_comments'].forEach((comment) {
        writtenComments!.add(ActivityComment.fromJson(comment));
      });
    }
    writtenCommentsNum = json['written_comments_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['introduction'] = introduction;
    if (hobbies != null) {
      data['hobbies_id'] = hobbies!.map((hobby) => hobby.id).toList();
    }
    if (jobs != null) {
      data['jobs_id'] = jobs!.map((job) => job.id).toList();
    }
    return data;
  }
}
