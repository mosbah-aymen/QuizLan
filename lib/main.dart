import 'impots.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.indigo),
        // fontFamily: 'Cinzel',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        'home': (context) => const Home(),
        const AnsweringRoom().id: (context) => const AnsweringRoom(),
        const AddQuestions().id: (context) => const AddQuestions(),
        'SignIn': (context) => SignIn(),
        'Login': (context) => LogOn(),
      },
    ));
    FlutterNativeSplash.remove();
  });
}
