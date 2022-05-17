import 'package:untitled/module/room.dart';
import 'package:untitled/module/user.dart';

import 'impots.dart';

List<Widget> pages = [CreateQuiz(), CreateOrJoinQuiz(), JoinQuiz()];
PageController controller = PageController(initialPage: 1);

User thisUser = User(name: '', email: "", id: 1);

List<User> users = [
  User(name: 'a', email: "a@gmail.com", password: 'a', id: 2, rooms: []),
];
List<Room> rooms = [];
