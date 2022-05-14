import 'package:untitled/impots.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          page == 1
              ? "Quiz Lan"
              : page == 0
                  ? "Create Quiz"
                  : "Join QUIZ",
          style: TextStyle(fontSize: 34),
        ),
      ),
      drawer: const MyDrawer(),
      body: PageView(
        children: pages,
        onPageChanged: (a) {
          setState(() {
            page = a;
          });
        },
        controller: controller,
      ),
    );
  }
}
