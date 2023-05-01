import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/presentation/detail/activity_tab_controller.dart';
import 'package:yne_flutter/features/activity/presentation/list/activities_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/responsive_center.dart';
import 'package:yne_flutter/constants/app_sizes.dart';

/// Shows the list of products with a search field at the top.
class ActivitiesListScreen extends ConsumerStatefulWidget {
  const ActivitiesListScreen({super.key});

  @override
  ConsumerState<ActivitiesListScreen> createState() =>
      _ActivitiesListScreenState();
}

class _ActivitiesListScreenState extends ConsumerState<ActivitiesListScreen> {
  // * Use a [ScrollController] to register a listener that dismisses the
  // * on-screen keyboard when the user scrolls.
  // * This is needed because this page has a search field that the user can
  // * type into.
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }
  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }
  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  // final PagingController<int, Activity> _pagingController =
  //     PagingController(firstPageKey: 1);

  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     ref
  //         .read(activityTabControllerProvider.notifier)
  //         .fetchActivity(pageKey, _pagingController);
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return RefreshIndicator(
  //       onRefresh: () => Future.sync(() => _pagingController.refresh()),
  //       child: Scaffold(
  //         backgroundColor: Colors.transparent,
  //         appBar: AppBar(
  //           elevation: 0,
  //           backgroundColor: Colors.transparent,
  //           automaticallyImplyLeading: false,
  //           title: Image.asset(
  //             "assets/images/YnE.png",
  //             width: 90,
  //           ),
  //           actions: const [
  //             Align(
  //               alignment: Alignment.center,
  //               child: Padding(
  //                 padding: EdgeInsets.only(right: 20.0),
  //                 child: FaIcon(FontAwesomeIcons.bell,
  //                     color: Color.fromRGBO(55, 71, 79, 0.756), size: 30),
  //               ),
  //             ),
  //           ],
  //         ),
  //         body: CustomScrollView(
  //           // controller: _scrollController,
  //           slivers: [
  //             SliverAppBar(
  //               pinned: true,
  //               backgroundColor: Colors.grey.shade100,
  //               title: SizedBox(
  //                 height: 40,
  //                 child: TextField(
  //                   textAlignVertical: TextAlignVertical.top,
  //                   cursorHeight: 25.0,
  //                   cursorColor: Colors.grey.shade800,
  //                   decoration: const InputDecoration(
  //                     prefixIcon: Icon(Icons.search,
  //                         color: Color.fromRGBO(55, 71, 79, 0.756)),
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //                       borderSide: BorderSide.none,
  //                     ),
  //                     filled: true,
  //                     fillColor: Color.fromRGBO(195, 195, 195, 1),
  //                   ),
  //                 ),
  //               ),
  //               bottom: PreferredSize(
  //                 preferredSize: const Size.fromHeight(2.0),
  //                 child: Container(
  //                   decoration: const BoxDecoration(
  //                     border: Border(
  //                       bottom: BorderSide(
  //                           color: Color.fromARGB(80, 158, 158, 158),
  //                           width: 2.0),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const ResponsiveSliverCenter(
  //               padding: EdgeInsets.all(Sizes.p16),
  //               child: ActivitiesGrid(),
  //             ),
  //           ],
  //         ),
  //       )
  //       // child: Container(
  //       //   constraints: BoxConstraints(
  //       //     minHeight: MediaQuery.of(context).size.height * 0.5,
  //       //   ),
  //       //   child: PagedListView<int, Activity>(
  //       //     physics: const BouncingScrollPhysics(),
  //       //     shrinkWrap: true,
  //       //     pagingController: _pagingController,
  //       //     builderDelegate: PagedChildBuilderDelegate<Activity>(
  //       //       itemBuilder: (context, item, index) => ListTile(
  //       //         title: Text(item.title!),
  //       //         // onTap: () {
  //       //         //   context.pushNamed(AppRoute.activityDetail.name, arguments: item.id!);
  //       //         // },
  //       //       ),
  //       //     ),
  //       //   ),
  //       // ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/YnE.png",
          width: 90,
        ),
        actions: const [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: FaIcon(FontAwesomeIcons.bell,
                  color: Color.fromRGBO(55, 71, 79, 0.756), size: 30),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.grey.shade100,
            title: SizedBox(
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                cursorHeight: 25.0,
                cursorColor: Colors.grey.shade800,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      color: Color.fromRGBO(55, 71, 79, 0.756)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(195, 195, 195, 1),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(80, 158, 158, 158), width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          const ResponsiveSliverCenter(
            padding: EdgeInsets.all(Sizes.p16),
            child: ActivitiesGrid(),
          ),
        ],
      ),
    );
  }
}
