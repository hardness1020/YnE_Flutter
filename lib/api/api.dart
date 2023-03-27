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
  static List activityList = [DioMethod.get, '$baseUrl/activity'];
  static List activityCreate = [DioMethod.post, '$baseUrl/activity'];
  static List activityRetrieve(String id) =>
      [DioMethod.get, '$baseUrl/activity/$id'];
  static List activityUpdate(String id) =>
      [DioMethod.patch, '$baseUrl/activity/$id'];
  static List activityDelete(String id) =>
      [DioMethod.delete, '$baseUrl/activity/$id'];
  static List activityLikedByUser(String id, String userID) =>
      [DioMethod.post, '$baseUrl/activity/$id/liked_by_user'];
  static List activityUnlikedByUser(String id, String userID) =>
      [DioMethod.post, '$baseUrl/activity/$id/unliked_by_user'];

  // ActivityCategory
  static List activityCategoryList = [
    DioMethod.get,
    '$baseUrl/activity/category'
  ];
  static List activityCategoryRetrieve(String id) =>
      [DioMethod.get, '$baseUrl/activity/category/$id'];

  // BackendUser
  static List backendUserRetrieveByToken = [
    DioMethod.get,
    '$baseUrl/user/profile'
  ];
}
