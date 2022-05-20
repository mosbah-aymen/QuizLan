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
      bottomSheet: BottomSheet(
        enableDrag: false,
        builder: (context) => SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    onPressed: () {},
                    icon: Icons.navigate_next_sharp,
                    color: Colors.green,
                    text: 'Send'),
              ],
            ),
          ),
        ),
        onClosing: () {},
      ),
      appBar: AppBar(
        title: Text("'${widget.room!.name!}' room"),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MaterialBanner(
                backgroundColor: Colors.indigo,
                content: Center(
                  child: Text(
                    "${thisUser.name!.split(' ').first.toUpperCase()}, Focus well",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                actions: [SizedBox()])),
      ),
      body: ListView.builder(
          itemBuilder: (context, i) => AnsweredQuestion(
                question: widget.room!.questions![i],
              ),
          itemCount: widget.room!.questions!.length),
    );
  }
}
