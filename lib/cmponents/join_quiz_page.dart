import 'package:untitled/impots.dart';

class JoinQuiz extends StatelessWidget {
  const JoinQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Join QUIZ",
              style: TextStyle(fontSize: 34),
            ),
            Image.asset("assets/images/Internet Day.gif", height: 300),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (s) {},
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Button(
              onPressed: () {},
              text: "Join Quiz",
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
