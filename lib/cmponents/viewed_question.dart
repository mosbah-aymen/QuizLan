import 'package:untitled/impots.dart';

class ViewedQuestion extends StatelessWidget {
  Question? question;
  List<int>? answered;
  ViewedQuestion({Key? key, this.question, this.answered}) : super(key: key);

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
                decoration: InputDecoration(
                    hintText: question!.content ?? 'no content',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                    //label: Text("Question"),
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: 70.0 * question!.choices!.length,
                child: ListView.builder(
                    itemBuilder: (context, i) {
                      int answ = i < answered!.length ? answered![i] : -2;
                      //answered != null ? answ = answered![i] : answ = -2;
                      return question == null
                          ? const Text('no question')
                          : ListTile(
                              leading: Icon(
                                  question!.correctChoice == i
                                      ? Icons.check_box
                                      : answ == i
                                          ? Icons
                                              .indeterminate_check_box_rounded
                                          : Icons.check_box_outline_blank,
                                  color: question!.correctChoice == i
                                      ? Colors.green
                                      : answ == i
                                          ? Colors.red
                                          : Colors.indigo),
                              title: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: question!.correctChoice == i ||
                                                answ == i
                                            ? 1
                                            : 0,
                                        color: question!.correctChoice == i
                                            ? Colors.green
                                            : answ == i
                                                ? Colors.red
                                                : Colors.indigo)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      enabled: false,
                                      hintText: question!.choices![i],
                                      hintStyle: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                            );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: question!.choices!.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
