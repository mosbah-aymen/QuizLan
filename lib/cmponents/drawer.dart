import 'package:untitled/impots.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/Internet Day.gif"),
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
        ],
      ),
    );
  }
}
