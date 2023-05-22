import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

class BackendUserService {
  final Ref ref;

  BackendUserService(this.ref);

  BackendUser? getHero() {
    final IntfBackendUserRepo backendUserRepo =
        ref.watch(backendUserRepoProvider);
    return backendUserRepo.getHero();
  }

  Future<BackendUser> fetchByToken({required String token}) async {
    final IntfBackendUserRepo backendUserRepo =
        ref.watch(backendUserRepoProvider);
    return await backendUserRepo.fetchByToken(token: token);
  }

  Future<BackendUser?> fetchRandomNextUser() async {
    final IntfBackendUserRepo backendUserRepo =
        ref.watch(backendUserRepoProvider);
    return await backendUserRepo.fetchRandomNextUser();
  }

  // TODO: fetch a list of backend users and create a provider for it to provide
  // users one at a time
  Future<List<BackendUser>?> fetchOtherBackendUsers() async {
    final IntfBackendUserRepo backendUserRepo =
        ref.watch(backendUserRepoProvider);
    return await backendUserRepo.fetchOtherBackendUsers();
  }
}

final backendUserServiceProvider =
    Provider.autoDispose<BackendUserService>((ref) => BackendUserService(ref));

final heroBackendUserProvider = Provider.autoDispose<BackendUser?>((ref) {
  final backendUserService = ref.watch(backendUserServiceProvider);
  return backendUserService.getHero();
});

final randomNextBackendUserFutureProvider =
    FutureProvider.autoDispose<BackendUser?>((ref) async {
  final backendUserService = ref.watch(backendUserServiceProvider);
  return await backendUserService.fetchRandomNextUser();
});

final backendUserByTokenFutureProvider =
    FutureProvider.autoDispose.family<BackendUser, String>((ref, token) async {
  final backendUserService = ref.watch(backendUserServiceProvider);
  return await backendUserService.fetchByToken(token: token);
});

final otherBackendUsersFetchedFutureProvider =
    FutureProvider.autoDispose<List<BackendUser>?>((ref) async {
  final backendUserService = ref.watch(backendUserServiceProvider);
  return await backendUserService.fetchOtherBackendUsers();
});
