// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:yne_flutter/app_config.dart';
// import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';
// import 'package:yne_flutter/features/backend_user/data/django/jg_backend_user_repo.dart';
// import 'package:yne_flutter/firebase_options.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

// void main() {
//   User makeUser() {
//     final container = ProviderContainer(
//       overrides: [],
//     );
//     addTearDown(container.dispose);
//     return container.read(userStreamProvider).value!;
//   }

//   group('fake backend user', () async {
//     // late DjangoBackendUserRepo backendUserRepo;
//     kUseFakeRepos = false;
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);
//     usePathUrlStrategy();
//     final backendUserRepo = DjangoBackendUserRepo();

//     final user = makeUser();
//     test('fetch by token', () async {
//       final backendUser =
//           await backendUserRepo.fetchByToken(token: await user.getIdToken());
//       backendUserRepo.setHero(backendUser: backendUser);
//       expect(backendUser, isNotNull);
//     });

//     test('random get next backend user', () async {
//       for (int i = 0; i < 5; i++) {
//         final backendUser = await backendUserRepo.fetchRandomNextUser();
//         expect(backendUser, isNotNull);
//       }
//     });

//     test("update user big pic", () async {
//       String token = await user.getIdToken();
//       final heroUser = await backendUserRepo.fetchByToken(token: token);
//       final oldId = heroUser.id;
//       final oldLink = heroUser.userHeadShotLink;
//       final updatedHeroUser = await backendUserRepo.updateBigPic(
//         token: token,
//         bigPic: File('assets/test/test_image.jpg'),
//       );
//       expect(updatedHeroUser, isNotNull);
//       expect(updatedHeroUser!.userHeadShotLink, equals(oldLink));
//       expect(updatedHeroUser.id, oldId);
//     });

//     test("update user avatar", () async {
//       String token = await user.getIdToken();
//       final heroUser = await backendUserRepo.fetchByToken(token: token);
//       final oldId = heroUser.id;
//       final oldLink = heroUser.userHeadShotLink;
//       final updatedHeroUser = await backendUserRepo.updateHeadShot(
//         token: token,
//         headshot: File('assets/test/test_image.jpg'),
//       );
//       expect(updatedHeroUser, isNotNull);
//       expect(updatedHeroUser!.userHeadShotLink, equals(oldLink));
//       expect(updatedHeroUser.id, oldId);
//     });
//   });
// }
