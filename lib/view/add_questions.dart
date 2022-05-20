import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';

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
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Button(
                      onPressed: () {
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
                        // _controller.animateTo(num + 1,
                        //     duration: const Duration(milliseconds: 1000),
                        //     curve: Curves.ease);
                      },
                      icon: Icons.add_circle_outline,
                      color: Colors.green,
                      text: 'Next'),
                ),
                Expanded(
                  child: Button(
                      onPressed: () {
                        setState(() {
                          questionList.add(Question(choices: [""]));
                        });
                      },
                      icon: Icons.navigate_next_sharp,
                      color: Colors.green,
                      text: 'Add Question'),
                ),
              ],
            ),
          ),
        ),
        onClosing: () {},
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => EditQuestion(question: questionList[i]),
        itemCount: questionList.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        padding: const EdgeInsets.only(bottom: 50),
      ),
      // body: PageView(
      //   children: QuestionListWidget,
      //   onPageChanged: (a) {
      //     setState(() {
      //       num = a;
      //     });
      //   },
      // ),
    );
  }
}
