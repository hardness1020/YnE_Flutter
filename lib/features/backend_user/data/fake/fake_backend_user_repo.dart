import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/delay.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeBackendUserRepo extends IntfBackendUserRepo {
  final InMemoryStore<BackendUser> _backendUser =
      InMemoryStore<BackendUser>(fakeUserList[0]);

  final bool addDelay;

  FakeBackendUserRepo({this.addDelay = false});

  @override
  Stream<BackendUser?> watchBackendUser() {
    return _backendUser.stream;
  }

  @override
  BackendUser? get getBackendUser => _backendUser.value;

  @override
  void setUser({required BackendUser backendUser}) {
    _backendUser.value = backendUser;
  }
  
  @override
  Future<BackendUser> fetchByToken({required String token}) async {
    await delay(addDelay);
    return _backendUser.value;
  }
}
