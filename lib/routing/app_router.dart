import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/my_home_page.dart';
import 'package:yne_flutter/routing/not_found_page.dart';
import 'package:yne_flutter/features/shared/presentation/pages/navigation_page.dart';

enum AppRoute {
  navigation,
  activityDetail,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.navigation.name,
          builder: (context, state) => const NavigationPage(),
          // routes: [
          //   GoRoute(
          //     path: 'activity/:id',
          //     name: AppRoute.activityDetail.name,
          //     builder: (context, state) =>
          //         const activityDetail(activityId: state.params['id']!),
          //   ),
          // ]
  )],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
