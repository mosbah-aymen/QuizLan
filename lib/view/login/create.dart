import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/user.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                  'QuizLAN',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
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
            SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    await login();
                    Navigator.popAndPushNamed(context, 'home');
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Have an account?'),
                TextButton(
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'Login');
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

  Future login() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    thisUser =
        User(id: 1, email: email, name: name, password: password, rooms: []);
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _pref;
    await prefs.setStringList('thisUser', <String>[name, email, password]);
    users.add(thisUser);
  }
}
