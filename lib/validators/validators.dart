// ignore_for_file: valid_regexps

import 'package:untitled/impots.dart';

class MyValidator {
  static bool name(String name) {
    return RegExp('^(?=.{4,20})(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+')
            .hasMatch(name) &&
        name.isNotEmpty;
  }

  static bool email(String email) {
    return email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
  }

  static bool password(String password) {
    return password.isNotEmpty &&
        RegExp('[a-zA-Z0-9 !@#\$&*~]').hasMatch(password);
  }
}

int missingFields(List<Question> questionList) {
  int count = 0;
  for (var element in questionList) {
    if ((element.content ?? "").isEmpty) {
      count++;
    }
    for (var e in element.choices!) {
      if (e.isEmpty) {
        count++;
      }
    }
  }
  return count;
}
