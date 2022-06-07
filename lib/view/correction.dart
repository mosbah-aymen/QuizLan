import 'package:untitled/impots.dart';

class Correction extends StatelessWidget {
  Room? room;
  List<int>? answered;
  Correction({Key? key, this.room, this.answered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Correction"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, i) => ViewedQuestion(
                question: room!.questions![i],
                answered: answered,
              ),
          itemCount: room!.questions!.length),
    );
  }
}
