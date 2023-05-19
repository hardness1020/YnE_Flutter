import 'package:flutter_test/flutter_test.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/chatroom/data/fake/fake_chatroom_repo.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

void main() {
  group("fake chatroom", () {
    kUseFakeRepos = true;
    final chatroomRepo = FakeChatroomRepo();
    test("set message", () async {
      DateTime now = DateTime.now();
      String convertedDateTime =
          "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
      final Message messageToSend = Message(
        uuid: "1",
        chatroomID: "1",
        heroRead: true,
        content: "test message",
        time: convertedDateTime,
        type: "sent",
      );
      chatroomRepo.receiveAndSetSentMessage(
          chatroomID: "1", message: messageToSend);
      Message watchedMessage =
          await chatroomRepo.watchSentMessage(chatroomID: "1").first;
      expect(watchedMessage.uuid, messageToSend.uuid);
    });

    test("user send message", () async* {
      DateTime now = DateTime.now();
      String convertedDateTime =
          "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
      Stream<Message> watchedMessageStream =
          chatroomRepo.watchSentMessage(chatroomID: "1");
      final Message messageToSend = Message(
        uuid: "2",
        chatroomID: "1",
        heroRead: true,
        content: "test message",
        time: convertedDateTime,
        type: "sent",
      );
      chatroomRepo.userSendMessage(
          chatroomID: "1", uuid: "2", content: "test message");
      await expectLater(watchedMessageStream, emits(messageToSend));
      await expectLater(watchedMessageStream, emitsDone);
    });
  });
}
