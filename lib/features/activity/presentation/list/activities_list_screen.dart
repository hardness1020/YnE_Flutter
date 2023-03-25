import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yne_flutter/features/activity/presentation/list/activities_grid.dart';
import 'package:flutter/material.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/responsive_center.dart';
import 'package:yne_flutter/constants/app_sizes.dart';


/// Shows the list of products with a search field at the top.
class ActivitiesListScreen extends StatefulWidget {
  const ActivitiesListScreen({super.key});

  @override
  State<ActivitiesListScreen> createState() => _ActivitiesListScreenState();
}

class _ActivitiesListScreenState extends State<ActivitiesListScreen> {
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
            backgroundColor: Colors.white,
            title: SizedBox(
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                cursorHeight: 25.0,
                cursorColor: Colors.grey.shade700,
                decoration: InputDecoration(
                 prefixIcon: const Icon(Icons.search, color: Color.fromRGBO(55, 71, 79, 0.756)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(80, 158, 158, 158), width: 2.0),
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
