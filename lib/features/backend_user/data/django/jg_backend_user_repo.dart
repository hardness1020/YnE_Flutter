import 'package:yne_flutter/api/api.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class DjangoBackendUserRepo extends IntfBackendUserRepo {
  @override
  // TODO: implement getBackendUser
  BackendUser? get getBackendUser => throw UnimplementedError();

  @override
  void setUser({required BackendUser backendUser}) {
    // TODO: implement setUser
  }

  @override
  Stream<BackendUser?> watchBackendUser() {
    // TODO: implement watchBackendUser
    throw UnimplementedError();
  }
  
  @override
  Future<BackendUser> fetchByToken({required String token}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        path: YNEApi.backendUserRetrieveByToken[1],
        method: YNEApi.backendUserRetrieveByToken[0],
        token: token,
      );
      final model = BackendUser.fromJson(responseData['data']);
      return model;
    } catch (_) {
      rethrow;
    }
  }
}
