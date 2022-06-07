import 'package:untitled/impots.dart';

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  List<Room>? rooms = [];
  List<Result>? results = [];
  User({this.id, this.name, this.email, this.password, this.rooms});
}
