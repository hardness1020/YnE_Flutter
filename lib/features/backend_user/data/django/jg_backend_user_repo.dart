import 'package:yne_flutter/api/api.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class DjangoBackendUserRepo extends IntfBackendUserRepo {
  @override
  Future<BackendUser> fetchByToken({required String token}) {
    // TODO: implement fetchByToken
    throw UnimplementedError();
  }

  @override
  Future<List<BackendUser>?> fetchOtherBackendUsers() {
    // TODO: implement fetchOtherBackendUsers
    throw UnimplementedError();
  }

  @override
  BackendUser? get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<BackendUser>? getOtherBackendUsers() {
    // TODO: implement getOtherBackendUsers
    throw UnimplementedError();
  }

  @override
  void set({required BackendUser backendUser}) {
    // TODO: implement set
  }

  @override
  void setOtherBackendUsers({required List<BackendUser> backendUserList}) {
    // TODO: implement setOtherBackendUsers
  }

  @override
  Stream<BackendUser?> watch() {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<BackendUser>?> watchOtherBackendUsers() {
    // TODO: implement watchOtherBackendUsers
    throw UnimplementedError();
  }

}
