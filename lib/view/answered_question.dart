import 'package:untitled/impots.dart';

class AnsweredQuestion extends StatefulWidget {
  final Question question;
  ValueChanged<int>? getResult;
  AnsweredQuestion({Key? key, required this.question, this.getResult})
      : super(key: key);

  @override
  State<AnsweredQuestion> createState() => _AnsweredQuestionState();
}

class _AnsweredQuestionState extends State<AnsweredQuestion> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: widget.question.content ?? 'no content',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                    //label: Text("Question"),
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Divider(
                height: 50,
                thickness: 1,
                color: Colors.indigo,
              ),
              SizedBox(
                height: 70.0 * widget.question.choices!.length,
                child: ListView.builder(
                    itemBuilder: (context, i) {
                      return widget.question == null
                          ? Text('no question')
                          : ListTile(
                              leading: IconButton(
                                  icon: Icon(
                                      selected == i
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      selected = i;
                                          widget.getResult!(selected);
                                    });
                                  }),
                              title: TextField(
                                decoration: InputDecoration(
                                    enabled: false,
                                    hintText: widget.question.choices![i],
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: widget.question.choices!.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
