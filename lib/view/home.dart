import 'package:untitled/impots.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: PageView(
        children: pages,
        controller: controller,
      ),
    );
  }
}
