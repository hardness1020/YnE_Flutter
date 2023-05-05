import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUnsentMessage(String message, String chatroomId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> unsentMessages = prefs.getStringList(chatroomId) ?? [];
  unsentMessages.add(message);
  await prefs.setStringList(chatroomId, unsentMessages);
}

Future<List<String>> getUnsentMessages(String chatroomId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(chatroomId) ?? [];
}

Future<int> getMsgListLength(String chatroomId) async {
  List<String> unsentMsgs = await getUnsentMessages(chatroomId);
  return unsentMsgs.length;
}

Future<void> clearUnsentMessages(String chatroomId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(chatroomId);
}
