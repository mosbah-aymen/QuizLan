import 'package:untitled/impots.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
              child: ListTile(
            title: Text(thisUser.name!),
          )),
          Card(
              child: ListTile(
            title: Text(thisUser.email!),
          )),
        ],
      ),
    );
  }
}
