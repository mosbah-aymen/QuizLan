import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/impots.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.indigo,
                    child: Text(
                      thisUser.name![0].toUpperCase(),
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // user screen
                    },
                    title: Text(
                      thisUser.email!,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
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
            onTap: () {},
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
              Icons.share,
              color: Colors.indigo,
            ),
            title: const Text("Share"),
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
              final success = await prefs.remove('thisUser');
              if (success) Navigator.popAndPushNamed(context, '/');
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
