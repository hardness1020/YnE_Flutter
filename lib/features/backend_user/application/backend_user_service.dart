import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';

class BackendUserService {
  final Ref ref;

  BackendUserService(this.ref);

  BackendUser? getHero() {
    final IntfBackendUserRepo backendUserRepo =
        ref.read(backendUserRepoProvider);
    return backendUserRepo.getHero();
  }



  // List<BackendUser>? getOtherBackendUsers() {
  //   final IntfBackendUserRepo backendUserRepo =
  //       ref.read(backendUserRepoProvider);
  //   return backendUserRepo.getOtherBackendUsers();
  // }

  // Future<BackendUser> fetchByToken({required String token}) async {
  //   final IntfBackendUserRepo backendUserRepo =
  //       ref.read(backendUserRepoProvider);
  //   return await backendUserRepo.fetchByToken(token: token);
  // }

  // TODO: fetch a list of backend users and create a provider for it to provide
  // users one at a time
  Future<List<BackendUser>?> fetchOtherBackendUsers() async {
    final IntfBackendUserRepo backendUserRepo =
        ref.read(backendUserRepoProvider);
    return await backendUserRepo.fetchOtherBackendUsers();
  }

    Future<BackendUser?> fetchRandomNextUser() async {
    final IntfBackendUserRepo backendUserRepo =
        ref.read(backendUserRepoProvider);
    return await backendUserRepo.fetchRandomNextUser();
  }

  // void setHero({required BackendUser backendUser}) {
  //   final IntfBackendUserRepo backendUserRepo =
  //       ref.read(backendUserRepoProvider);
  //   backendUserRepo.setHero(backendUser: backendUser);
  // }

  // void setOtherBackendUsers({required List<BackendUser> backendUserList}) {
  //   final IntfBackendUserRepo backendUserRepo =
  //       ref.read(backendUserRepoProvider);
  //   backendUserRepo.setOtherBackendUsers(backendUserList: backendUserList);
  // }
}

final backendUserServiceProvider =
    Provider.autoDispose<BackendUserService>((ref) => BackendUserService(ref));

final heroBackendUserProvider = Provider.autoDispose<BackendUser?>((ref) {
  final backendUserService = ref.read(backendUserServiceProvider);
  return backendUserService.getHero();
});

// final otherBackendUsersProvider =
//     Provider.autoDispose<List<BackendUser>?>((ref) {
//   final backendUserService = ref.read(backendUserServiceProvider);
//   return backendUserService.getOtherBackendUsers();
// });

final randomNextBackendUserFutureProvider =
    FutureProvider.autoDispose<BackendUser?>((ref) async {
  final backendUserService = ref.read(backendUserServiceProvider);
  return await backendUserService.fetchRandomNextUser();
});

// final backendUserByTokenFutureProvider =
//     FutureProvider.autoDispose.family<BackendUser, String>((ref, token) async {
//   final backendUserService = ref.read(backendUserServiceProvider);
//   return await backendUserService.fetchByToken(token: token);
// });

final otherBackendUsersFetchedFutureProvider =
    FutureProvider.autoDispose<List<BackendUser>?>((ref) async {
  final backendUserService = ref.read(backendUserServiceProvider);
  return await backendUserService.fetchOtherBackendUsers();
});
