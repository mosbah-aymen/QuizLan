import 'package:untitled/impots.dart';

class EditQuestion extends StatefulWidget {
  Question? question;
  EditQuestion({Key? key, this.question}) : super(key: key);

  @override
  State<EditQuestion> createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  int choicesNumber = 1;
  int selected = -1;

  TextEditingController contentController = TextEditingController();
  List<TextEditingController> choicesController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  void initState() {
    selected = widget.question!.correctChoice ?? -1;
    contentController = TextEditingController(text: widget.question!.content);
    choicesNumber = widget.question!.choices!.length;
    for (int i = 0; i < choicesNumber; i++) {
      choicesController[i] =
          TextEditingController(text: widget.question!.choices![i]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (v) => v!.isEmpty ? 'Please enter the question' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: contentController,
            onChanged: (s) {
              widget.question!.content = s;
            },
            decoration: InputDecoration(
                label: Text("Question"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    if (choicesNumber < 5) {
                      setState(() {
                        choicesNumber++;
                        choicesController.add(TextEditingController());
                        widget.question!.choices!.add("");
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("you can add only 5 choices"),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),
                      ));
                    }
                  },
                ),
                Text("$choicesNumber"),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (choicesNumber > 0) {
                      setState(() {
                        choicesNumber--;
                        choicesController.removeLast();
                        widget.question!.choices!.removeLast();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90.0 * choicesNumber,
            child: ListView.builder(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: IconButton(
                        icon: Icon(
                            selected == i
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green),
                        onPressed: () {
                          setState(() {
                            selected = i;
                            widget.question!.correctChoice = i;
                          });
                        }),
                    title: SizedBox(
                      height: 85,
                      child: TextFormField(
                        validator: (v) =>
                            v!.isEmpty ? 'Please enter a text' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: choicesController[i],
                        onChanged: (s) {
                          widget.question!.choices![i] = s;
                        },
                        decoration: InputDecoration(
                            label: Text("choice 0${i + 1}"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                itemCount: choicesNumber),
          ),
        ],
      ),
    );
  }
}
