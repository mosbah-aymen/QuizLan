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
    int i = 0;
    Room room = Room();
    if (rooms.isNotEmpty) {
      rooms.forEach((element) {
        print(element.name);
        if (element.name == name) {
          room = element;
          print("found");
          return;
        }
      });
    } else {
      print("no rooms");
    }
    return room;
  }

  static bool hasCorrectInformations(String name, String password) {
    print(findRoom(name).password);
    return findRoom(name).password == password && password.isNotEmpty;
  }
}
