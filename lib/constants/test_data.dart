import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';


final fakeActivityCategoryList = [
  ActivityCategory(id:'1', name:'Category 1'),
  ActivityCategory(id:'2', name:'Category 2'),
  ActivityCategory(id:'3', name:'Category 3'),
  ActivityCategory(id:'4', name:'Category 4'),
  ActivityCategory(id:'5', name:'Category 5'),
];

final fakeActivityList = [
  Activity(id:'1', name:'Activity 1', categories:[fakeActivityCategoryList[0]]),
  Activity(id:'2', name:'Activity 2', categories:[fakeActivityCategoryList[1]]),
];