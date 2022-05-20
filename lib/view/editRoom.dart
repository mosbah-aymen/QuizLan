import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';

class EditRoom extends StatefulWidget {
  Room room;
  EditRoom({Key? key, required this.room}) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name!),
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
                      if (thisUser.rooms == null) {
                        thisUser.rooms = [];
                      }
                      //thisUser.rooms!.add(room!);
                      // Navigator.popUntil(context, (route) => route.isFirst);
                      // Navigator.popAndPushNamed(context, 'home');
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
          itemBuilder: (context, i) => EditQuestion(
                question: widget.room.questions![i],
              ),
          itemCount: widget.room.questions!.length),
    );
  }
}
