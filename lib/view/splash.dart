import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/user.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<Widget> loadFromFuture() async {
    // <fetch data from server. ex. login>
    final SharedPreferences prefs = await _prefs;
    List<String>? tUser = await prefs.getStringList("thisUser");
    if (tUser != null) thisUser = User(name: tUser[0], email: tUser[1]);
    return Future.value(tUser != null ? const Home() : SignIn());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadFromFuture(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          return snapshot.hasData
              ? snapshot.data!
              : const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
        });
  }
}
