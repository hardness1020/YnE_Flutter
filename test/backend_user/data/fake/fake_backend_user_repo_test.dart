import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/backend_user/application/backend_user_service.dart';
import 'package:yne_flutter/features/backend_user/data/fake/fake_backend_user_repo.dart';

void main() {
  group('fake backend user', () {
    // late DjangoBackendUserRepo backendUserRepo;x
    kUseFakeRepos = true;
    final backendUserRepo = FakeBackendUserRepo();


    test('random get next backend user', () async {
      for (int i = 0; i < 5; i++) {
        final backendUser = await backendUserRepo.fetchRandomNextUser();
        expect(backendUser, isNotNull);
      }
    });
  });
}
