class Message {
  String? uuid;
  String? senderUserID;
  String? chatroomID;
  bool? heroRead;
  String? content;
  String? time;
  String? type; //sent or received
  DateTime? dateTime;

  Message({
    this.uuid,
    this.senderUserID,
    this.chatroomID,
    this.heroRead,
    this.content,
    this.time,
    this.type,
  }) {
    if (time != null) {
      dateTime = DateTime.parse(time!);
    }
  }

  void setUUID(String uuid) {
    this.uuid = uuid;
  }
}
