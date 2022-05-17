import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/contrller/userCrtl.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/user.dart';

class LogOn extends StatelessWidget {
  LogOn({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'QuizLan',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName or Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    String name = nameController.text;
                    String pass = passwordController.text;
                    User? user = UserCrtl.confirmPassAndGetUser(name, pass);
                    if (user!.id != -1) {
                      thisUser = user;
                      final Future<SharedPreferences> _pref =
                          SharedPreferences.getInstance();
                      final SharedPreferences prefs = await _pref;
                      await prefs.setStringList(
                          'thisUser', <String>[name, user.email!, pass]);
                      Navigator.popAndPushNamed(context, 'home');
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Wrong Password"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("cancel")),
                                ],
                              ));
                    }
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'SignIn');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
