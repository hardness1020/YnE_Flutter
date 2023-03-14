import 'package:yne_flutter/features/activity/domain/activity.dart';

class ActivityLocation {
  String? id;
  String? name;
  List<Activity>? activities;

  ActivityLocation({this.id, this.name, this.activities});

  ActivityLocation.fromJson(Map<String, dynamic> json) {
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
