import 'package:untitled/module/room.dart';
import 'package:untitled/module/user.dart';

import 'impots.dart';

List<Widget> pages = [CreateQuiz(), CreateOrJoinQuiz(), JoinQuiz()];
PageController controller = PageController(initialPage: 1);

User thisUser = User(name: 'mosbah', email: "mosbah@gmail.com", id: 123);

List<Room> rooms = [];
