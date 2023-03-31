import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';
import 'package:yne_flutter/features/backend_user/data/django/jg_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/data/fake/fake_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

abstract class IntfBackendUserRepo {
  Stream<BackendUser?> watch();

  void setHero({required BackendUser backendUser});

  BackendUser? getHero();

  Future<BackendUser> fetchByToken({required String token});

  Future<BackendUser?> fetchRandomNextUser();

  Future<List<BackendUser>?> fetchOtherBackendUsers();
}

final backendUserRepoProvider = Provider<IntfBackendUserRepo>((ref) {
  final backendUserRepo =
      kUseFakeRepos ? FakeBackendUserRepo() : DjangoBackendUserRepo();
  return backendUserRepo;
});

final backendUserStreamProvider =
    StreamProvider.autoDispose<BackendUser?>((ref) {
  final backendUserRepo = ref.watch(backendUserRepoProvider);
  return backendUserRepo.watch();
});

final backendHeroSynchronizeProvider = FutureProvider<BackendUser>((ref) async {
  final user = ref.watch(userStreamProvider).value!;

  final backendUserRepo = ref.watch(backendUserRepoProvider);
  final backendUser =
      await backendUserRepo.fetchByToken(token: await user.getIdToken());
  backendUserRepo.setHero(backendUser: backendUser);
  return backendUser;
});
