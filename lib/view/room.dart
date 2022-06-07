import 'package:untitled/contrller/resultCrtl.dart';
import 'package:untitled/impots.dart';

class AnsweringRoom extends StatefulWidget {
  String get id => "room";
  final Room? room;
  const AnsweringRoom({Key? key, this.room}) : super(key: key);

  @override
  State<AnsweringRoom> createState() => _AnsweringRoomState();
}

class _AnsweringRoomState extends State<AnsweringRoom> {
  List<int> answering = [];

  int time = 20;
  @override
  void initState() {
    controller;
    widget.room!.duration = Duration(seconds: 120);
    for (int i = 0; i < widget.room!.questions!.length; i++) {
      answering.add(-1);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        enableDrag: false,
        builder: (context) => SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    width: 100,
                    onPressed: () {
                      if (allAnswered(answering)) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Confirmation !"),
                                  content: const Text(
                                    "Are you sure to confirm your submittion ?"
                                    "\nYou can not be able to enter again",
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          Result result = Result(
                                              answered: answering,
                                              room: widget.room!,
                                              userName: thisUser.name,
                                              userID: thisUser.id,
                                              dateTime: DateTime.now());
                                          result.dateTime;
                                          //Navigator.pop(context);
                                          waiting(context);
                                          await ResultCrtl
                                              .addResultOfThisUserInRoom(
                                                  result);
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst);
                                          Navigator.popAndPushNamed(
                                              context, 'home');
                                        },
                                        child: const Text('I confirm'))
                                  ],
                                ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please answer all the questions")));
                      }
                    },
                    icon: Icons.send,
                    color: Colors.green,
                    text: 'Send'),
              ],
            ),
          ),
        ),
        onClosing: () {},
      ),
      appBar: AppBar(
        title: Text(widget.room!.name!),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: MaterialBanner(
                backgroundColor: Colors.indigo,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      " Focus well",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    widget.room!.duration == null
                        ? const SizedBox()
                        : TweenAnimationBuilder(
                            builder: (BuildContext context, Duration v,
                                Widget? child) {
                              time = v.inSeconds;
                              return Text(
                                '${v.inMinutes}:${(v.inSeconds % 60).toInt()}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: time < 30
                                        ? Colors.red[300]
                                        : Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                            onEnd: () {
                              endTime();
                            },
                            duration: widget.room!.duration!,
                            tween: Tween(
                                begin: widget.room!.duration!,
                                end: Duration.zero),
                          ),
                  ],
                ),
                actions: const [SizedBox()])),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
            itemBuilder: (context, i) => AnsweredQuestion(
                  question: widget.room!.questions![i],
                  getResult: (isCorrect) {
                    answering[i] = isCorrect;
                  },
                ),
            itemCount: widget.room!.questions!.length),
      ),
    );
  }

  bool allAnswered(List<int> answering) {
    bool yes = true;

    for (int element in answering) {
      if (element == -1) {
        yes = false;
      }
    }

    return yes;
  }

  void endTime() {}
}
