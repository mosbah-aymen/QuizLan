import 'package:untitled/contrller/sharedPref.dart';
import 'package:untitled/impots.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'QuizWAN',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                      shadows: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 7,
                          offset: Offset(1, 2),
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          offset: Offset(-1, 1),
                        ),
                      ]),
                )),
            // Hero(
            //   tag: 'logo',
            //   child: SizedBox(
            //     child: Image.asset(
            //       "assets/images/QuizWAN.png",
            //       height: 150,
            //     ),
            //   ),
            // ),
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.isEmpty || !MyValidator.name(v)
                    ? "please do not forget your name"
                    : null,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.isEmpty
                    ? "please do not forget your email"
                    : !MyValidator.email(v)
                        ? "Please enter a valid email"
                        : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.isEmpty
                    ? "Please enter a powerful password"
                    : !MyValidator.password(v) || v.length < 8
                        ? "your password is weak"
                        : null,
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
                    waiting(context);

                    await login(context);
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Have an account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'Login');
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  bool eveyThingIsValid() {
    return MyValidator.name(nameController.text) &&
        MyValidator.email(emailController.text) &&
        MyValidator.password(passwordController.text);
  }

  void showAlert(context, String title, String subtitle) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
            ));
  }

  Future login(context) async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (!MyValidator.name(name)) {
      Navigator.pop(context);
      showAlert(context, "Wrong Name",
          'you have entered a wrong name .Please verify and try again');
    } else if (!MyValidator.email(email)) {
      Navigator.pop(context);
      showAlert(context, "Wrong email",
          'you have entered a wrong email .Please verify and try again');
    } else if (!MyValidator.password(password) || password.length < 8) {
      Navigator.pop(context);
      showAlert(context, "Wrong password",
          'It must be 8 characteres and alphaNumeric. Please verify and try again');
    } else {
      String? id =
          await UserCrtl.getUserByEmailOrName(email).then((value) => value.id);
      Navigator.pop(context);
      if (id != null) {
        showAlert(context, "Used Email", usedEmail);
      } else {
        id = await UserCrtl.postUserAndGetID(name, email, password);
        thisUser = User(
            id: id, email: email, name: name, password: password, rooms: []);
        Pref.saveUserId(thisUser.id!);
        controller = PageController(initialPage: 1);
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, 'home');
      }
    }
  }
}
