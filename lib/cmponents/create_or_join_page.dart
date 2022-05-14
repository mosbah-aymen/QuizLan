import 'package:untitled/impots.dart';

class CreateOrJoinQuiz extends StatelessWidget {
  const CreateOrJoinQuiz({Key? key}) : super(key: key);

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
              "QUIZ LAN",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/Internet Day.gif", height: 300),
            Button(
              onPressed: () {
                controller.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              text: 'Create Quiz',
              color: Colors.blueAccent,
              icon: Icons.add_circle_outline,
            ),
            Button(
              onPressed: () {
                controller.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              text: "Join Quiz",
            ),
          ],
        ),
      ),
    );
  }
}
