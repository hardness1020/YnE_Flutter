import 'package:yne_flutter/constants/test_data.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/utils/delay.dart';
import 'package:yne_flutter/utils/in_memory_store.dart';

class FakeBackendUserRepo extends IntfBackendUserRepo {
  BackendUser? _previousOtherRandomUser;
  final InMemoryStore<BackendUser> _heroBackendUser =
      InMemoryStore<BackendUser>(fakeHeroUser);
  final bool addDelay;
  FakeBackendUserRepo({this.addDelay = true});

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
      await delay(addDelay);
      return fakeHeroUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BackendUser?> fetchRandomNextUser() async {
    try {
      delay(addDelay);
      if (fakeOtherUserList.isEmpty) {
        throw Exception('No other users');
      }
      fakeOtherUserList.shuffle();
      for (int i = 0; i < fakeOtherUserList.length; i++) {
        if (_previousOtherRandomUser == null ||
            _previousOtherRandomUser!.id != fakeOtherUserList[i].id) {
          _previousOtherRandomUser = fakeOtherUserList[i];
          print('previous user: ${_previousOtherRandomUser!.name}');
          return _previousOtherRandomUser;
        }
      }
      if (_previousOtherRandomUser != null) {
        return _previousOtherRandomUser;
      }
      throw Exception('No other users');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BackendUser>?> fetchOtherBackendUsers() async {
    try {
      await delay(addDelay);
      return fakeOtherUserList;
    } catch (e) {
      rethrow;
    }
  }
}
