import 'package:untitled/impots.dart';

class AddQuestions extends StatefulWidget {
  String get id => "addQuestions";
  final Room? room;
  const AddQuestions({Key? key, this.room}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  int num = 0;
  List<Question> questionList = [
    Question(choices: [""]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room!.name ?? ""),
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
                      int missing = missingFields(questionList);
                      if (missing == 0) {
                        setState(() {
                          widget.room!.questions = questionList;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmAndCreate(
                                room: widget.room!,
                              ),
                            ),
                          );
                        });
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
                    icon: Icons.navigate_next_sharp,
                    color: Colors.indigo,
                    text: 'Next'),
              ),
              Expanded(
                child: Button(
                    onPressed: () {
                      setState(() {
                        questionList.add(Question(choices: [""]));
                      });
                    },
                    icon: Icons.add_circle_outline,
                    color: Colors.green,
                    text: 'Add Question'),
              ),
            ],
          ),
        ),
        onClosing: () {},
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => Stack(
          alignment: Alignment.topRight,
          children: [
            EditQuestion(question: questionList[i]),
            // IconButton(
            //   onPressed: () {
            //     if (questionList.length > 1) {
            //       questionList.removeAt(i);
            //       widget.room!.questions = questionList;
            //       setState(() {});
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content:
            //             Text("Please, let at least 1 question in the room"),
            //         backgroundColor: Colors.indigo,
            //       ));
            //     }
            //   },
            //   icon: const Icon(Icons.highlight_remove_outlined),
            // ),
          ],
        ),
        itemCount: questionList.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        padding: const EdgeInsets.only(bottom: 50),
      ),
    );
  }
}
