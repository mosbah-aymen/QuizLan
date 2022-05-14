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
  @override
  Widget build(BuildContext context) {
    return Card(
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
                onChanged: (s) {
                  widget.question!.content = s;
                  print(widget.question!.content);
                },
                decoration: InputDecoration(
                    label: Text("Question"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              // SizedBox(
              //   height: 50,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.image,
              //         color: Colors.blue,
              //       ),
              //       Text(
              //         "Add Image",
              //         style: TextStyle(color: Colors.blue),
              //       ),
              //     ],
              //   ),
              // ),
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
                            widget.question!.choices!.add("");
                          });
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("you can add only 5 choices"),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 1),
                          ));
                        }
                      },
                    ),
                    Text("$choicesNumber"),
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (choicesNumber > 0) {
                          setState(() {
                            choicesNumber--;
                            widget.question!.choices!.removeLast();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70.0 * choicesNumber,
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
                        title: TextField(
                          onChanged: (s) {
                            widget.question!.choices![i] = s;
                          },
                          decoration: InputDecoration(
                              label: Text("choice 0${i + 1}"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: choicesNumber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
