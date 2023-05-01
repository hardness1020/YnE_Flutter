// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:tuple/tuple.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:yne_flutter/constants/app_sizes.dart';
// import 'package:yne_flutter/features/activity/presentation/list/activity_card.dart';
// import 'package:yne_flutter/features/chatroom/presentation/detail/message_model.dart';
// import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';
// import 'package:yne_flutter/features/activity/domain/activity.dart';
// import 'package:yne_flutter/features/activity/application/activity_service.dart';

// class ChatroomDetailPage extends ConsumerStatefulWidget {
//   // const ActivityDetailPage({Key? key}) : super(key: key);
//   const ChatroomDetailPage({super.key, required this.chatroomId});
//   final String chatroomId;

//   @override
//   ConsumerState<ChatroomDetailPage> createState() => _ChatroomDetailPageState();
// }

// class _ChatroomDetailPageState extends ConsumerState<ChatroomDetailPage>
//     with TickerProviderStateMixin {
//   final _textEditingController = TextEditingController();
//   bool shouldRebuild = false;
//   @override
//   void initState() {
//     super.initState();
//     _textEditingController.text = "";
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         toolbarHeight: 65,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Color.fromRGBO(55, 71, 79, 0.956),
//                 size: 25,
//               ),
//             ),
//             const CircleAvatar(
//               radius: 22,
//               backgroundImage: AssetImage("assets/images/woman.jpg"),
//             ),
//             gapW16,
//             const Expanded(
//               child: Text("Amy",
//                   style: TextStyle(
//                       color: Color.fromARGB(255, 39, 42, 80),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700)),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.phone_outlined,
//                   color: Color.fromRGBO(55, 71, 79, 0.956), size: 30),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.more_vert,
//                   color: Color.fromRGBO(55, 71, 79, 0.956), size: 30),
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: messages.length,
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.only(top: 10, bottom: 10),
//                   itemBuilder: (context, index) {
//                     // cur => F: I send; T: I recieve
//                     // prev, next => T: same with cur, F: not same with cur
//                     bool cur = messages[index].messageType == "receiver";
//                     bool prev = (index > 0)
//                         ? messages[index].messageType ==
//                             messages[index - 1].messageType
//                         : false;
//                     bool next = (index < messages.length - 1)
//                         ? messages[index].messageType ==
//                             messages[index + 1].messageType
//                         : false;
//                     Tuple4<int, int, int, int> round =
//                         getDecor(prev, cur, next);
//                     double curve = 20.0;
//                     return Container(
//                       padding: EdgeInsets.only(
//                           left: 14, right: 14, top: prev ? 0 : 15, bottom: 5),
//                       child: Align(
//                         alignment: (messages[index].messageType == "receiver"
//                             ? Alignment.topLeft
//                             : Alignment.topRight),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(curve * round.item1),
//                               bottomLeft: Radius.circular(curve * round.item2),
//                               topRight: Radius.circular(curve * round.item3),
//                               bottomRight: Radius.circular(curve * round.item4),
//                             ),
//                             color: messages[index].messageType == "receiver"
//                                 ? const Color.fromARGB(255, 241, 241, 245)
//                                 : (messages[index].messageType == "sender"
//                                     ? const Color.fromARGB(255, 254, 189, 47)
//                                     : const Color.fromARGB(255, 175, 133, 253)),
//                           ), // test 1 test 2 test 3
//                           padding: const EdgeInsets.all(16),
//                           child: Text(
//                             messages[index].messageContent,
//                             style: const TextStyle(fontSize: 15),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 75),
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 330,
//                   height: 70,
//                   child: Container(
//                     color: Colors.grey.shade100,
//                     padding:
//                         const EdgeInsets.only(left: 20, bottom: 25, right: 20),
//                     child: TextField(
//                       autofocus: true,
//                       focusNode: FocusNode(),
//                       textAlignVertical: TextAlignVertical.bottom,
//                       controller: _textEditingController,
//                       // focusNode: focusNode,
//                       textInputAction: TextInputAction.send,
//                       keyboardType: TextInputType.text,
//                       onSubmitted: (value) => onSendMessage(value),
//                       textCapitalization: TextCapitalization.sentences,
//                       decoration: const InputDecoration(
//                         hintText: " 輸入文字...",
//                         hintStyle: TextStyle(
//                             fontSize: 16,
//                             color: Color.fromRGBO(64, 65, 71, 0.45)),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(
//                               color: Color.fromRGBO(205, 205, 205, 0.918)),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 gapW4,
//                 SizedBox(
//                   width: 25,
//                   height: 70,
//                   child: Container(
//                     padding: const EdgeInsets.only(bottom: 40),
//                     child: IconButton(
//                         onPressed: () {
//                           onSendMessage(_textEditingController.text);
//                         },
//                         icon: const Icon(Icons.send_rounded),
//                         color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Tuple4<int, int, int, int> getDecor(bool prev, bool cur, bool next) {
//     int tl = 0, bl = 0, tr = 0, br = 0;
//     // cur => F: I send; T: I recieve
//     if (!cur) {
//       tl = 1;
//       bl = 1;
//     } else {
//       tr = 1;
//       br = 1;
//     }
//     // prev, next => T: same with cur, F: not same with cur
//     if (!prev) {
//       tl = 1;
//       tr = 1;
//     } else if (!next) {
//       bl = 1;
//       br = 1;
//     }
//     return Tuple4(tl, bl, tr, br);
//   }

//   void onSendMessage(String value) {
//     if (!shouldRebuild) {
//       if (value.trim().isNotEmpty) {
//         final newMessage =
//             ChatMessage(messageContent: value, messageType: 'sending');
//         messages.add(newMessage);
//         _textEditingController.clear();
//       }
//       setState(() {
//         shouldRebuild = true;
//       });
//       Future.delayed(const Duration(seconds: 3), () {
//         setState(() {
//           messages.last.messageType = 'sender';
//           shouldRebuild = false;
//         });
//       });
//     }

//     //else {
//     //   Fluttertoast.showToast(
//     //       msg: 'Nothing to send', backgroundColor: Colors.grey);
//     // }
//   }
// }
