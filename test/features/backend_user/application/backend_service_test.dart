import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/backend_user/application/backend_user_service.dart';

void main() {
  kUseFakeRepos = true;
  BackendUserService makeService() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container.read(backendUserServiceProvider);
  }

  group("backend service test", () {
    test('backend user service test', () async {
      final backendUserService = makeService();
      for (int i = 0; i < 5; i++) {
        final backendUser = await backendUserService.fetchRandomNextUser();
        expect(backendUser, isNotNull);
      }
    });
  });
}
