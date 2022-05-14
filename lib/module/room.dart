import 'package:untitled/module/question.dart';
import 'package:untitled/module/user.dart';

class Room {
  int? id;
  String? name;
  String? password;
  User? creator;
  List<Question>? questions = [];
  List<User>? users = [];

  Room(
      {required this.id,
      this.name,
      this.password,
      this.creator,
      this.questions,
      this.users});
}
