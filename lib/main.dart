import 'package:flutter/services.dart';

import 'impots.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/': (context) => const Home(),
        const AnsweringRoom().id: (context) => const AnsweringRoom(),
        AddQuestions().id: (context) => AddQuestions(),
      },
    ));
  });
}
