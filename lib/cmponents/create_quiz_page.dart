import 'package:untitled/contrller/RoomCrtl.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';

class CreateQuiz extends StatelessWidget {
  CreateQuiz({Key? key}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create QUIZ",
              style: TextStyle(fontSize: 34),
            ),
            TextField(
              onChanged: (s) {
                name = s;
              },
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  label: Text('Room Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Button(
              onPressed: () {
                Room room = Room(
//                    id: 1,
                    name: name,
                    creator: thisUser,
                    password: RoomCrtl.generatePassword(),
                    questions: [],
                    users: []);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddQuestions(
                      room: room,
                    ),
                  ),
                );
              },
              text: "Create Now",
              icon: Icons.add_circle_outline,
            ),
            Button(
              onPressed: () {
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              text: "Cancel",
              icon: Icons.cancel_outlined,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
