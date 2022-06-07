import 'package:untitled/contrller/resultCrtl.dart';
import 'package:untitled/contrller/sharedPref.dart';
import 'package:untitled/impots.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  Future<Widget> loadFromFuture() async {
    String? tUserID = await Pref.getUserID();
    if (tUserID != null && tUserID != "") {
      thisUser = await UserCrtl.getUserFromDBbyID(tUserID);
      thisUser.results = await ResultCrtl.getAllResultsOfThisUser();
    }

    return Future.value(
        (tUserID != null && tUserID != "") ? const Home() : SignIn());
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
