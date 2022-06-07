import 'package:untitled/impots.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              color: Colors.indigo,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      thisUser.name![0].toUpperCase(),
                      style: const TextStyle(fontSize: 38, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // user screen
                    },
                    title: Text(
                      thisUser.name!,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      thisUser.email!,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.indigo,
            ),
            title: const Text(
              "Setings",
            ),
            onTap: () async {
              // thisUser.rooms = await UserCrtl.getRoomsOfUser([
              //   "gGC2tD0Q9oGJdEPYwJJH",
              //   "Q7rwvXt9m05cl6sWXoQ4",
              // ]);
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.star_rate,
              color: Colors.indigo,
            ),
            title: const Text("Rate-us"),
            onTap: () {},
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: const Icon(
              Icons.send,
              color: Colors.indigo,
            ),
            title: const Text("Contact-us"),
            onTap: () {},
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.indigo,
            ),
            title: const Text("About app"),
            onTap: () {},
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            thickness: 1,
            color: Colors.indigo,
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.indigo,
            ),
            title: const Text("Log out"),
            onTap: () async {
              final Future<SharedPreferences> _prefs =
                  SharedPreferences.getInstance();
              final SharedPreferences prefs = await _prefs;
              final success = await prefs.remove('thisUserID');
              if (success) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.popAndPushNamed(context, '/');
              }
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          Image.asset("assets/images/QuizWAN.png"),
        ],
      ),
    );
  }
}
