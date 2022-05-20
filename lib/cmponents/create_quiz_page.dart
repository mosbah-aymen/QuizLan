import 'package:untitled/impots.dart';

class CreateQuiz extends StatelessWidget {
  CreateQuiz({Key? key}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.5,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/Internet Day.gif", height: 200),
                const Text(
                  "Create and share quizzes from QuizWAN Dashboard,\nSwitch to MyQuizzes to start creating quizzes.\nPress join to enter a room and start answering Now",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextField(
// onChanged: (s) {
// name = s;
// },
// style: const TextStyle(fontSize: 24),
// textAlign: TextAlign.center,
// decoration: InputDecoration(
// label: Text('Room Name'),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20))),
// ),
// ),
// Button(
// onPressed: () {
// Room room = Room(
// //                    id: 1,
// name: name,
// creator: thisUser,
// password: RoomCrtl.generatePassword(),
// questions: [],
// users: []);
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => AddQuestions(
// room: room,
// ),
// ),
// );
// },
// text: "Create Now",
// icon: Icons.add_circle_outline,
// ),
