// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yne_flutter/features/chatroom/presentation/list/chatroom_card.dart';
import 'package:yne_flutter/features/chatroom/presentation/list/chatroom_grid.dart';
import 'package:flutter/material.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/responsive_center.dart';
import 'package:yne_flutter/constants/app_sizes.dart';

/// Shows the list of products with a search field at the top.
class ChatroomListScreen extends StatefulWidget {
  const ChatroomListScreen({super.key});

  @override
  State<ChatroomListScreen> createState() => _ChatroomListScreenState();
}

class _ChatroomListScreenState extends State<ChatroomListScreen> {
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
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("聊天室",
              style: TextStyle(
                  color: Color.fromRGBO(42, 53, 59, 1),
                  fontSize: 27,
                  fontWeight: FontWeight.w800)),
        ),
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
                textAlignVertical: TextAlignVertical.bottom,
                cursorColor: Colors.grey.shade700,
                decoration: const InputDecoration(
                  hintText: "搜尋",
                  hintStyle: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.55)),
                  prefixIcon: Icon(Icons.search,
                      color: Color.fromRGBO(55, 71, 79, 0.756)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(205, 205, 205, 0.918)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
            child: ChatroomGrid(),
          ),
        ],
      ),
    );
  }
}
