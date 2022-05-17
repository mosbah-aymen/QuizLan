import 'package:untitled/constans.dart';
import 'package:untitled/module/user.dart';

class UserCrtl {
  static User findUser(String name, String email) {
    return users.firstWhere(
        (element) => element.name == name && element.email == email);
  }

  static User? confirmPassAndGetUser(String name, String password) {
    User? user = users.firstWhere(
        (element) => element.name == name || element.email == name,
        orElse: () => User(id: -1));
    if (user.password == password) {
      return user;
    } else {
      return User(id: -1);
    }
  }
}
