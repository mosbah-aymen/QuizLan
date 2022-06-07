import 'package:untitled/impots.dart';

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
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                    onPressed: () {
                      setState(() {
                        widget.room.questions!.add(Question(choices: [""]));
                      });
                    },
                    icon: Icons.add_circle_outline,
                    color: Colors.green,
                    text: 'Add Question'),
              ),
              Expanded(
                child: Button(
                    onPressed: () async {
                      setState(() {});
                      int missing = missingFields(widget.room.questions!);
                      if (missing == 0) {
                        await RoomCrtl.updateRoom(widget.room);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Saved",
                                  style: TextStyle(fontSize: 18),
                                )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "You have missed $missing field",
                              style: TextStyle(fontSize: 18),
                            )));
                      }
                      // _controller.animateTo(num + 1,
                      //     duration: const Duration(milliseconds: 1000),
                      //     curve: Curves.ease);
                    },
                    icon: Icons.save,
                    color: Colors.indigo,
                    text: 'Save'),
              ),
            ],
          ),
        ),
        onClosing: () {},
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ListView.builder(
            itemBuilder: (context, i) => EditQuestion(
                  question: widget.room.questions![i],
                ),
            itemCount: widget.room.questions!.length),
      ),
    );
  }
}
