import 'package:untitled/impots.dart';

class Room {
  String? id;
  String? name;
  String? password;
  String? creator;
  List<Question>? questions = [];
  List<String>? users = [];
  List<Result>? results = [];
  Duration? duration;
  int submittionsNumber;

  DateTime? dateTime;

  Room(
      {this.id,
      this.name,
      this.password,
      this.creator,
      this.duration,
      this.questions,
      this.users,
      this.dateTime,
      this.results,
      this.submittionsNumber = 1});
}
