import 'package:flutter/services.dart';
import 'package:untitled/impots.dart';

class JoinQuiz extends StatelessWidget {
  const JoinQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return thisUser.rooms == null || thisUser.rooms!.isEmpty
        ? const Center(
            child: Text(
              "No rooms",
            ),
          )
        : ListView.builder(
            itemBuilder: (context, i) => Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(5),
                onLongPress: () {
                  Clipboard.setData(
                          ClipboardData(text: thisUser.rooms![i].password))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to your clipboard !')));
                  });
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditRoom(
                                room: thisUser.rooms![i],
                              )));
                },
                title: Text(
                  thisUser.rooms![i].name ?? " no name entered",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.indigo,
                    child: Text(
                      thisUser.rooms![i].name![0].toUpperCase(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                    splashRadius: 20),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${thisUser.rooms![i].questions!.length} question"),
                    Text("${thisUser.rooms![i].users!.length} user"),
                  ],
                ),
              ),
            ),
            itemCount: thisUser.rooms!.length,
          );
  }
}
//
// Center(
// child: Card(
// margin: const EdgeInsets.all(10),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// //mainAxisAlignment: MainAxisAlignment.spaceAround,
// mainAxisSize: MainAxisSize.min,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextField(
// onChanged: (s) {},
// style: const TextStyle(fontSize: 24),
// textAlign: TextAlign.center,
// decoration: InputDecoration(
// label: const Text("Room Name"),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10))),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextField(
// onChanged: (s) {},
// style: const TextStyle(fontSize: 24),
// textAlign: TextAlign.center,
// decoration: InputDecoration(
// label: const Text("Password"),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10))),
// ),
// ),
// SizedBox(
// height: 50,
// ),
// SizedBox(
// height: 70,
// child: Row(
// children: [
// Expanded(
// child: Button(
// onPressed: () {},
// text: "Join Quiz",
// ),
// ),
// Expanded(
// child: Button(
// onPressed: () {
// controller.animateToPage(1,
// duration: const Duration(milliseconds: 500),
// curve: Curves.ease);
// },
// text: "Cancel",
// icon: Icons.cancel_outlined,
// color: Colors.red,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// );
