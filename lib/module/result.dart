import 'package:untitled/impots.dart';

class Result {
  String? id;
  String? userName;
  String? userID;
  Room? room;
  List<int>? answered = [];
  DateTime? dateTime;
  double? score;

  double? theScore() {
    int s = 0;
    for (int i = 0; i < answered!.length; i++) {
      if (answered![i] == room!.questions![i].correctChoice!) {
        s++;
      }
    }
    score = (s * 100) / room!.questions!.length;
    return score;
  }

  String printScore() {
    score = theScore();
    return score!.toInt().toString() + '%';
    //return score!.toInt().toString() + '/' + room!.questions!.length.toString();
  }

  Result(
      {this.id,
      this.userName,
      this.room,
      this.answered,
      this.score,
      this.userID,
      this.dateTime});

  List<int> correctAnswers() {
    List<int> tmp = [];
    for (int i = 0; i < answered!.length; i++) {
      if (answered![i] == room!.questions![i].correctChoice) {
        tmp.add(answered![i]);
      }
    }
    return tmp;
  }
}
