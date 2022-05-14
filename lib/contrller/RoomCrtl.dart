import 'dart:math';

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
}
