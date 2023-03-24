import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/presentation/password_forgetfulness/password_forgetfulness_page.dart';
import 'package:yne_flutter/features/auth/presentation/sign_in/sign_in_page.dart';
import 'package:yne_flutter/features/auth/presentation/sign_up/sign_up_page.dart';
import 'package:yne_flutter/routing/not_found_page.dart';
import 'package:yne_flutter/features/shared/presentation/pages/navigation_page.dart';

enum AppRoute {
  signIn,
  signUp,
  passwordForgetfulness,
  navigation,
  activityDetail,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(userStreamProvider);

  return GoRouter(
    initialLocation: '/signIn',
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
                  builder: (context, state) => const PasswordForgetfulnessPage(),
                ),
              ],
            ),
          ]
  )],
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
