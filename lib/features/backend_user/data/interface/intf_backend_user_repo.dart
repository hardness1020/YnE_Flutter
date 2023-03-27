import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';
import 'package:yne_flutter/features/backend_user/data/django/jg_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/data/fake/fake_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

abstract class IntfBackendUserRepo {
  Stream<BackendUser?> watchBackendUser();

  BackendUser? get getBackendUser;
  void setUser({required BackendUser backendUser});

  Future<BackendUser> fetchByToken({required String token});
}

final backendUserRepoProvider = Provider<IntfBackendUserRepo>((ref) {
  final backendUserRepo =
      kUseFakeRepos ? FakeBackendUserRepo() : DjangoBackendUserRepo();
  return backendUserRepo;
});

final backendUserStreamProvider =
    StreamProvider.autoDispose<BackendUser?>((ref) {
  final backendUserRepo = ref.watch(backendUserRepoProvider);
  return backendUserRepo.watchBackendUser();
});

final userProvider = FutureProvider<BackendUser?>((ref) async {
  final user = ref.watch(userStreamProvider).value!;

  final backendUserRepo = ref.read(backendUserRepoProvider);
  final backendUser =
      backendUserRepo.fetchByToken(token: await user.getIdToken());
  backendUserRepo.setUser(backendUser: await backendUser);
  return backendUser;
});
