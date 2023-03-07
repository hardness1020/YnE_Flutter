import 'package:yne_flutter/features/activity/domain/activity_category.dart';

class Activity {
  String? id;
  String? name;
  List<ActivityCategory>? categories;

  Activity({this.id, this.name, this.categories});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['categories'] != null) {
      categories = <ActivityCategory>[];
      json['categories'].forEach((v) {
        categories!.add(ActivityCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
