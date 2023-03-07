import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:yne_flutter/features/shared/presentation/pages/navigation_state.dart';
import 'package:yne_flutter/my_home_page.dart';
import 'package:yne_flutter/features/activity/presentation/activity_page.dart';

class NavigationPage extends ConsumerWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationStateProvider);

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        disableDefaultTabController: true,
        initialActiveIndex: state,
        style: TabStyle.reactCircle,
        color: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: const <TabItem>[
          TabItem(
            icon: Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.house,
              ),
            ),
          ),
          TabItem(
            icon: Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.bookOpen,
              ),
            ),
          ),
          TabItem(
            icon: Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.bell,
              ),
            ),
          ),
          TabItem(
            icon: Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.user,
              ),
            ),
          ),
        ],
        onTap: (index) {
          ref.read(navigationStateProvider.notifier).updateIndex(index);
        },
      ),
      body: IndexedStack(
        index: state,
        children: const <Widget>[
          MyHomePage(title: '1',),
          ActivityPage(),
          MyHomePage(title: '3',),
          MyHomePage(title: '4',),
        ],
      ),
    );
  }
}