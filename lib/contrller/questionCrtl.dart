import 'package:untitled/impots.dart';

class QuestionCrtl {
  static List<Question> getQuestionsFromMap(List<dynamic> data) {
    List<Question> tmp = [];
    for (var v in data) {
      List<String> value = v.split('§');
      Question q = Question(
          content: value.first,
          choices: value.sublist(2, value.length - 1),
          correctChoice: int.parse(value[1]));
      tmp.add(q);
    }
    return tmp;
  }

  static String convertListToString(List<String> list) {
    String s = "";
    for (var value in list) {
      s += value + '§';
    }

    return s;
  }

  static List<String> getMapFromQuestions(List<Question> questions) {
    List<String> tmp = [];
    for (var value in questions) {
      tmp.add(convertListToString([
            value.content!,
            value.correctChoice.toString(),
          ] +
          value.choices!));
    }

    return tmp;
  }
}
