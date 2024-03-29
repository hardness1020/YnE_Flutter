import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

class ActivityComment {
  String? id;
  String? content;
  String? date;
  Activity? belongedActivity;
  BackendUser? author;

  ActivityComment(
      {this.id,
      this.content,
      this.date,
      this.belongedActivity,
      this.author});

  ActivityComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    date = json['date'];
    belongedActivity = Activity.fromJson(json['belonged_activity']);
    author = BackendUser.fromJson(json['author']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['date'] = date;
    data['belonged_activity'] = belongedActivity!.toJson();
    data['author'] = author!.toJson();
    return data;
  }
}
