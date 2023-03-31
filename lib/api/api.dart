import 'package:yne_flutter/utils/net_utils.dart';

class YNEApi {
  /*
   * 1. baseUrl: backend server url
   * 
   * 2. Variable:
   *    - naming rule:
   *        - {object}List: get list of objects    (get)
   *        - {object}Retrieve: get object detail  (get)
   *        - {object}Create: create object        (post)
   *        - {object}Update: update object        (patch)
   *        - {object}Delete: delete object        (delete)
   *        - {object}{Action}: action of object     
   *    - param:
   *        - method: http method
   *        - path: api path 
   */

  // static const baseUrl = "https://xxxxxx.tw:10507";
  static const baseUrl = "http://172.28.27.82:8000";

  // Activity
  static List activityList(String page) =>
      [DioMethod.get, '$baseUrl/activity/?page=$page'];
  static List activityCreate = [DioMethod.post, '$baseUrl/activity'];
  static List activityRetrieve(String activityID) =>
      [DioMethod.get, '$baseUrl/activity/$activityID'];
  static List activityDelete(String activityID) =>
      [DioMethod.delete, '$baseUrl/activity/$activityID'];
  static List activityUpdate(String activityID) =>
      [DioMethod.put, '$baseUrl/activity/$activityID'];
  static List userLikeActivity(String activityID) =>
      [DioMethod.patch, '$baseUrl/activity/$activityID/user_like_activity'];
  static List userUnlikeActivity(String activityID) =>
      [DioMethod.patch, '$baseUrl/activity/$activityID/user_unlike_activity'];
  static List userJoinActivity(String activityID) =>
      [DioMethod.patch, '$baseUrl/activity/$activityID/user_join_activity'];
  static List userUnjoinActivity(String activityID) =>
      [DioMethod.patch, '$baseUrl/activity/$activityID/user_unjoin_activity'];
  static List userToggleLikeActivity(String activityID) => [
        DioMethod.patch,
        '$baseUrl/activity/$activityID/user_toggle_like_activity'
      ];
  static List userToggleJoinActivity(String activityID) => [
        DioMethod.patch,
        '$baseUrl/activity/$activityID/user_toggle_join_activity'
      ];

  // ActivityCategory
  static List activityCategoryList = [
    DioMethod.get,
    '$baseUrl/activity/category'
  ];
  static List activityCategoryRetrieve(String activityCategoryID) =>
      [DioMethod.get, '$baseUrl/activity/category/$activityCategoryID'];

  // User
  static List nextBackendUser = [DioMethod.get, '$baseUrl/next_django_user'];
  static List heroBackendUser = [DioMethod.get, '$baseUrl/hero_django_user'];

  // BackendUser
  static List backendUserRetrieveByToken = [
    DioMethod.get,
    '$baseUrl/user/profile'
  ];
}
