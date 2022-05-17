import 'package:untitled/cmponents/viewed_question.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';

class ConfirmAndCreate extends StatelessWidget {
  Room? room;
  ConfirmAndCreate({Key? key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation"),
        centerTitle: true,
      ),
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
                    onPressed: () {
                      thisUser.rooms!.add(room!);
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.popAndPushNamed(context, 'home');
                    },
                    icon: Icons.navigate_next_sharp,
                    color: Colors.green,
                    text: 'I confirm'),
              ],
            ),
          ),
        ),
        onClosing: () {},
      ),
      body: ListView.builder(
          itemBuilder: (context, i) => ViewedQuestion(
                question: room!.questions![i],
              ),
          itemCount: room!.questions!.length),
    );
  }
}
