import 'package:untitled/module/user.dart';

import 'impots.dart';

List<Widget> pages = [CreateQuiz(), CreateOrJoinQuiz(), JoinQuiz()];
PageController controller = PageController(initialPage: 1);

User thisUser = User(name: 'mosbah', email: "mosbah@gmail.com", id: 123);
