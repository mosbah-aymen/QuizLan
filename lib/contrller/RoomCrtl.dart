import 'dart:math';

import 'package:untitled/constans.dart';
import 'package:untitled/module/room.dart';

class RoomCrtl {
  static String generatePassword() {
    String s = "";
    Random random = Random();
    while (s.length < 5) {
      int a = random.nextInt(10);
      s += "$a";
    }
    return s;
  }

  static Room findRoom(String name) {
    return rooms.firstWhere((element) => element.name == name,
        orElse: () => Room(id: -1));
  }

  static bool hasCorrectInformations(String name, String password) {
    return findRoom(name).password == password && password.isNotEmpty;
  }
}
