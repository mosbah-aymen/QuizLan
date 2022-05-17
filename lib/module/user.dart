import 'package:untitled/module/room.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Room>? rooms = [];

  User({this.id, this.name, this.email, this.password, this.rooms});
}
