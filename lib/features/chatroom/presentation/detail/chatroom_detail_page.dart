import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/chatroom/application/chatroom_service.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/presentation/detail/temp_message_storage.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_widget.dart';

class ChatroomDetailPage extends ConsumerStatefulWidget {
  const ChatroomDetailPage({super.key, required this.chatroomId});
  final String chatroomId;

  @override
  ConsumerState<ChatroomDetailPage> createState() => _ChatroomDetailPageState();
}

class _ChatroomDetailPageState extends ConsumerState<ChatroomDetailPage>
    with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  List<String> tempMsgs = [];
  String tempMsg = "";
  String status = "success"; // temp
  bool shouldRebuild = false;
  @override
  void initState() {
    super.initState();
    _textEditingController.text = "";
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatroomValue = ref.watch(chatroomFutureProvider(widget.chatroomId));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AsyncValueWidget<ChatRoom?>(
        value: chatroomValue,
        data: (chatroom) => Stack(
          children: [
            Column(
              children: [
                gapH64,
                gapH12,
                Expanded(
                  child: FutureBuilder<List<String>>(
                      future: getUnsentMessages(widget.chatroomId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<String> unsentMsgs = snapshot.data!;
                          int unsentLen = unsentMsgs.length;
                          return ListView.builder(
                            reverse: true,
                            itemCount: unsentLen + chatroom!.messages!.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            itemBuilder: (context, index) {
                              // cur => F: I send; T: I recieve
                              // prev, next => T: same with cur, F: not same with cur
                              if (index < unsentLen) {
                                index = unsentLen - 1 - index;

                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14, top: 0, bottom: 5),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(20.0),
                                          bottomLeft:
                                              const Radius.circular(20.0),
                                          topRight: Radius.circular(
                                              index == 0 ? 20.0 : 0.0),
                                          bottomRight: Radius.circular(
                                              index == unsentLen - 1
                                                  ? 20.0
                                                  : 0.0),
                                        ),
                                        color: shouldRebuild &&
                                                index == unsentLen - 1
                                            ? const Color.fromARGB(
                                                255, 175, 133, 253)
                                            : const Color.fromARGB(
                                                255, 133, 213, 253),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        unsentMsgs[index],
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              index = index - unsentLen;
                              bool cur =
                                  chatroom.messages![index]!.type == "received";
                              bool prev = (index > 0)
                                  ? chatroom.messages![index]!.type ==
                                      chatroom.messages![index - 1]!.type
                                  : false;
                              bool next =
                                  (index < chatroom.messages!.length - 1)
                                      ? chatroom.messages![index]!.type ==
                                          chatroom.messages![index + 1]!.type
                                      : false;
                              Tuple4<int, int, int, int> round =
                                  getDecor(prev, cur, next);
                              double curve = 20.0;
                              final msg = chatroom.messages![index]!;
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                    top: prev ? 0 : 15,
                                    bottom: 5),
                                child: Align(
                                  alignment: (msg.type == "received"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            curve * round.item1),
                                        bottomLeft: Radius.circular(
                                            curve * round.item2),
                                        topRight: Radius.circular(
                                            curve * round.item3),
                                        bottomRight: Radius.circular(
                                            curve * round.item4),
                                      ),
                                      color: msg.type == "received"
                                          ? const Color.fromARGB(
                                              255, 241, 241, 245)
                                          : (msg.type == "sent"
                                              ? const Color.fromARGB(
                                                  255, 254, 189, 47)
                                              : const Color.fromARGB(
                                                  255, 175, 133, 253)),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      msg.content!,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                ),
                const SizedBox(height: 90),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  Container(
                    color: Colors.grey.shade100,
                    height: 60,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromRGBO(55, 71, 79, 0.956),
                            size: 25,
                          ),
                        ),
                        chatroom!.chatPartner?.userHeadShotLink != null
                            ? ClipOval(
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                          child: SizedBox(
                                              width: 22,
                                              height: 22,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 3.0,
                                              )),
                                        ),
                                    imageUrl:
                                        chatroom.chatPartner!.userHeadShotLink!,
                                    width: 44,
                                    height: 44,
                                    fit: BoxFit.fill),
                              )
                            : const CircleAvatar(
                                radius: 22,
                                backgroundImage:
                                    AssetImage("assets/images/user.jpg"),
                              ),
                        gapW16,
                        Expanded(
                          child: Text(chatroom.chatPartner?.name ?? "Anonymous",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 39, 42, 80),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone_outlined,
                              color: Color.fromRGBO(55, 71, 79, 0.956),
                              size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert,
                              color: Color.fromRGBO(55, 71, 79, 0.956),
                              size: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 330,
                      height: 70,
                      child: Container(
                        color: Colors.grey.shade100,
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 25, right: 20),
                        child: TextField(
                          autofocus: true,
                          focusNode: FocusNode(),
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: _textEditingController,
                          // focusNode: focusNode,
                          textInputAction: TextInputAction.send,
                          keyboardType: TextInputType.text,
                          onSubmitted: (value) => onSendMessage(value),
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            hintText: " 輸入文字...",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(64, 65, 71, 0.45)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(205, 205, 205, 0.918)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    gapW4,
                    SizedBox(
                      width: 25,
                      height: 70,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: IconButton(
                            onPressed: () {
                              onSendMessage(_textEditingController.text);
                            },
                            icon: const Icon(Icons.send_rounded),
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 20,
              child: SizedBox(
                width: 25,
                height: 70,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          sendSuccess();
                        });
                      },
                      icon: const Icon(Icons.check),
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tuple4<int, int, int, int> getDecor(bool prev, bool cur, bool next) {
    int tl = 0, bl = 0, tr = 0, br = 0;
    // cur => F: I send; T: I recieve
    if (!cur) {
      tl = 1;
      bl = 1;
    } else {
      tr = 1;
      br = 1;
    }
    // prev, next => T: same with cur, F: not same with cur
    if (!prev) {
      tl = 1;
      tr = 1;
    } else if (!next) {
      bl = 1;
      br = 1;
    }
    return Tuple4(tl, bl, tr, br);
  }

  void sendSuccess() {
    clearUnsentMessages(widget.chatroomId);
  }

  void onSendMessage(String value) {
    if (!shouldRebuild) {
      if (value.trim().isNotEmpty) {
        // final newMessage =
        //     ChatMessage(messageContent: value, messageType: 'sending');
        // messages.add(newMessage);
        saveUnsentMessage(value, widget.chatroomId);
        _textEditingController.clear();
      }
      setState(() {
        // print(status);
        shouldRebuild = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          // status = "success";
          // messages.last.messageType = 'sender';
          // print(status);
          shouldRebuild = false;
        });
      });
    }
  }
}
