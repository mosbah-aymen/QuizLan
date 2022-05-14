import 'package:untitled/impots.dart';

class QuestioninRoom extends StatefulWidget {
  final Question? question;
  const QuestioninRoom({Key? key,this.question}) : super(key: key);

  @override
  State<QuestioninRoom> createState() => _QuestioninRoomState();
}

class _QuestioninRoomState extends State<QuestioninRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(

      ),
    );
  }
}
