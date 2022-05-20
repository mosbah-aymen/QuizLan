import 'package:flutter/material.dart';
import 'package:untitled/contrller/RoomCrtl.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/module/room.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int page = 1;
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 120,
        height: 50,
        child: tabController!.index == 2
            ? null
            : FloatingActionButton(
                isExtended: true,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text(tabController!.index == 0
                            ? "Join Room"
                            : "Create Quiz"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: joinOrCreate(tabController!.index == 0),
                        ),
                        actions: tabController!.index == 0
                            ? [
                                TextButton(
                                    onPressed: () {
                                      print(password);
                                      if (RoomCrtl.hasCorrectInformations(
                                          name, password)) {
                                        Room room = RoomCrtl.findRoom(name);
                                        Navigator.pop(context);
                                        joinRoom(room);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Incorrect information',
                                            ),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text("Join")),
                                TextButton(
                                  onPressed: () {
                                    print(rooms[0].password);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                )
                              ]
                            : [
                                TextButton(
                                    onPressed: () {
                                      createRoom();
                                    },
                                    child: Text("Create")),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                )
                              ]),
                  );
                },
                backgroundColor: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: tabController!.index == 0
                      ? [
                          Icon(Icons.add_circle_outline),
                          Text("Join", style: TextStyle(fontSize: 20)),
                        ]
                      : [
                          Icon(Icons.add_circle_outline),
                          Text("Create", style: TextStyle(fontSize: 20)),
                        ],
                ),
              ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "QuizWAN",
          style: TextStyle(fontSize: 34),
        ),
        bottom: TabBar(
          controller: tabController,
          onTap: (a) {
            page = a;
            setState(() {});
          },
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "HOME"),
            Tab(icon: Icon(Icons.create_new_folder), text: 'My Quizzes'),
            Tab(icon: Icon(Icons.person), text: "Profile"),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: TabBarView(
          children: pages,
          controller: tabController,
          physics: NeverScrollableScrollPhysics()),
      // body: PageView(
      //   children: pages,
      //   onPageChanged: (a) {
      //     setState(() {
      //       page = a;
      //     });
      //   },
      //   controller: controller,
      // ),
    );
  }

  String name = "";
  String password = '';
  List<Widget> joinOrCreate(bool joinOrCreate) => joinOrCreate
      ? [
          TextField(
            onChanged: (s) {
              name = s;
            },
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Room Name"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: (s) {
              password = s;
            },
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Password"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ]
      : [
          TextField(
            onChanged: (s) {
              name = s;
            },
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: Text('Room Name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ];

  void createRoom() {
    Room room = Room(
        id: 1,
        name: name,
        creator: thisUser,
        password: RoomCrtl.generatePassword(),
        questions: [],
        users: []);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddQuestions(
          room: room,
        ),
      ),
    );
  }

  void joinRoom(Room room) {
    room.users!.add(thisUser);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnsweringRoom(
          room: room,
        ),
      ),
    );
  }
}
