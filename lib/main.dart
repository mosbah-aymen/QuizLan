import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'impots.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: Colors.teal,
        // fontFamily: 'Cinzel',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        'home': (context) => const Home(),
        AnsweringRoom().id: (context) => AnsweringRoom(),
        AddQuestions().id: (context) => AddQuestions(),
        'SignIn': (context) => SignIn(),
        'Login': (context) => LogOn(),
      },
    ));
    FlutterNativeSplash.remove();
  });
}
