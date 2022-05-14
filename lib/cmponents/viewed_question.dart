import 'package:untitled/impots.dart';

class ViewedQuestion extends StatelessWidget {
  Question? question;
  ViewedQuestion({Key? key, this.question}) : super(key: key);

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
                height: 70.0 * question!.choices!.length,
                child: ListView.builder(
                    itemBuilder: (context, i) {
                      return question == null
                          ? Text('no question')
                          : ListTile(
                              leading: Icon(
                                  question!.correctChoice == i
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: Colors.green),
                              title: TextField(
                                decoration: InputDecoration(
                                    enabled: false,
                                    hintText: question!.choices![i],
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
                    itemCount: question!.choices!.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
