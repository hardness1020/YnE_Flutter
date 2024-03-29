import 'package:yne_flutter/features/activity/domain/activity.dart';

class ActivityCategory {
  String? id;
  String? name;
  List<Activity>? activities;

  ActivityCategory({this.id, this.name, this.activities});

  ActivityCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['activities'] != null) {
      activities = <Activity>[];
      json['activties'].forEach((v) {
        activities!.add(Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
