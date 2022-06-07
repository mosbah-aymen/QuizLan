import 'package:untitled/module/room.dart';
import 'package:untitled/module/user.dart';

import 'impots.dart';

List<Widget> pages = [JoinQuiz(), MyQuizzes(), HistoryAttempt()];
PageController controller = PageController(initialPage: 1);
String usedEmail =
    'this email is used by another person.Please try a different email';

User thisUser = User(name: '', email: "", id: "1", rooms: rooms);

List<User> users = [
  User(name: 'a', email: "a@gmail.com", password: 'a', id: "2", rooms: []),
];
List<Room> rooms = [];
