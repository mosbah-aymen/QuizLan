import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';
import 'package:untitled/view/answered_question.dart';

class AnsweringRoom extends StatefulWidget {
  String get id => "room";
  final Room? room;
  const AnsweringRoom({Key? key, this.room}) : super(key: key);

  @override
  State<AnsweringRoom> createState() => _AnsweringRoomState();
}

class _AnsweringRoomState extends State<AnsweringRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemBuilder: (context, i) =>
              AnsweredQuestion(question: widget.room!.questions![i])),
    );
  }
}
