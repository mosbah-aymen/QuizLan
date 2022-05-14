import 'package:untitled/impots.dart';

class JoinQuiz extends StatelessWidget {
  const JoinQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (s) {},
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    label: const Text("Room Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (s) {},
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    label: const Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      onPressed: () {},
                      text: "Join Quiz",
                    ),
                  ),
                  Expanded(
                    child: Button(
                      onPressed: () {
                        controller.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      text: "Cancel",
                      icon: Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
