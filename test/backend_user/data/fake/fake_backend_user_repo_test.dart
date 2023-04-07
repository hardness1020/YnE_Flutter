import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/backend_user/data/fake/fake_backend_user_repo.dart';

void main() {
  group('fake bakcend user', () {
    // late DjangoBackendUserRepo backendUserRepo;
    kUseFakeRepos = false;
    final backendUserRepo = FakeBackendUserRepo();

    test('random get next backend user', () {
      final backendUser = backendUserRepo.fetchRandomNextUser();
      expect(backendUser, isNotNull);
    });
  });
}
