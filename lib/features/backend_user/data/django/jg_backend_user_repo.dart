import 'package:yne_flutter/api/api.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';
import 'package:yne_flutter/utils/net_utils.dart';

class DjangoBackendUserRepo extends IntfBackendUserRepo {
  final InMemoryStore<BackendUser?> _heroBackendUser =
      InMemoryStore<BackendUser?>(null);

  DjangoBackendUserRepo();

  @override
  Stream<BackendUser?> watch() {
    try {
      return _heroBackendUser.stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setHero({required BackendUser backendUser}) {
    try {
      _heroBackendUser.value = backendUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  BackendUser? getHero() {
    try {
      return _heroBackendUser.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BackendUser> fetchByToken({required String token}) async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.heroBackendUser[0],
        path: YNEApi.heroBackendUser[1],
        token: token,
      );
      final backendUser = BackendUser.fromJson(responseData['data']);
      return backendUser;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BackendUser?> fetchRandomNextUser() async {
    try {
      final responseData = await NetUtils().reqeustData(
        method: YNEApi.nextBackendUser[0],
        path: YNEApi.nextBackendUser[1],
      );
      return BackendUser.fromJson(responseData['data']);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BackendUser>?> fetchOtherBackendUsers() {
    // TODO: implement fetchOtherBackendUsers
    throw UnimplementedError();
  }
}
