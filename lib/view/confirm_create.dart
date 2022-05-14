import 'package:untitled/cmponents/viewed_question.dart';
import 'package:untitled/impots.dart';

class ConfirmAndCreate extends StatelessWidget {
  List<Question> questions;
  ConfirmAndCreate({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, i) => ViewedQuestion(
                question: questions[i],
              ),
          itemCount: questions.length),
    );
  }
}
