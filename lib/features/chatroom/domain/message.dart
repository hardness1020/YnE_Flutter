class Message {
  String? chatroomID;
  bool? heroRead;
  String? content;
  String? time;
  String? type; //sent or received

  Message({this.chatroomID, this.heroRead, this.content, this.time});
}
