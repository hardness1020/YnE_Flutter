import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/presentation/password_forgetfulness/password_forgetfulness_page.dart';
import 'package:yne_flutter/features/auth/presentation/sign_in/sign_in_page.dart';
import 'package:yne_flutter/features/auth/presentation/sign_up/sign_up_page.dart';
import 'package:yne_flutter/features/backend_user/data/interface/intf_backend_user_repo.dart';
import 'package:yne_flutter/features/chatroom/presentation/detail/chatroom_detail_page.dart';
import 'package:yne_flutter/routing/not_found_page.dart';
import 'package:yne_flutter/features/shared/presentation/pages/navigation_page.dart';
import 'package:yne_flutter/features/activity/presentation/detail/activity_detail_page.dart';

enum AppRoute {
  signIn,
  signUp,
  passwordForgetfulness,
  navigation,
  activityDetail,
  chatroomDetail
}

final goRouterProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(userProvider);

  return GoRouter(
    // initialLocation: '/signIn',
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.navigation.name,
          builder: (context, state) => const NavigationPage(),
          routes: [
            GoRoute(
              path: 'signIn',
              name: AppRoute.signIn.name,
              builder: (context, state) => const SignInPage(),
              routes: [
                GoRoute(
                  path: 'signUp',
                  name: AppRoute.signUp.name,
                  builder: (context, state) => const SignUpPage(),
                ),
                GoRoute(
                  path: 'passwordForgetfulness',
                  name: AppRoute.passwordForgetfulness.name,
                  builder: (context, state) =>
                      const PasswordForgetfulnessPage(),
                ),
              ],
            ),
            GoRoute(
                path: 'activity/:id',
                name: AppRoute.activityDetail.name,
                builder: (context, state) {
                  final activityId = state.params['id']!;
                  return ActivityDetailPage(activityId: activityId);
                }),
            GoRoute(
                path: 'chatroom/:id',
                name: AppRoute.chatroomDetail.name,
                builder: (context, state) {
                  final chatroomId = state.params['id']!;
                  return ChatroomDetailPage(chatroomId: chatroomId);
                }),
          ])
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
    // redirect: (context, state) {
    //   if (authState.value != null) {
    //     return '/';
    //   } else {
    //     return '/signIn';
    //   }
    // },
  );
});
