import 'package:untitled/impots.dart';

class AnsweringRoom extends StatefulWidget {
  String get id => "room";
  const AnsweringRoom({Key? key}) : super(key: key);

  @override
  State<AnsweringRoom> createState() => _AnsweringRoomState();
}

class _AnsweringRoomState extends State<AnsweringRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          ListView.builder(itemBuilder: (context, i) => const QuestioninRoom()),
    );
  }
}
