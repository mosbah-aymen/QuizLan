import 'dart:io';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untitled/contrller/resultCrtl.dart';
import 'package:untitled/impots.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int page = 1;
  TabController? tabController;

  Barcode? barcode;
  bool cameraPaused = false;
  @override
  void initState() {
    getResults();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (controller != null) {
      if (Platform.isAndroid) {
        await controller!.pauseCamera();
      }
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabController!.addListener(() {
      setState(() {
        // page = tabController!.index;
      });
    });

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
                            : "Create Quiz Room"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: joinOrCreate(tabController!.index == 0),
                        ),
                        actions: tabController!.index == 0
                            ? [
                                TextButton(
                                    onPressed: () {
                                      joinRoom("Q7rwvXt9m05cl6sWXoQ4");
                                    },
                                    child: Text("Join")),
                                TextButton(
                                  onPressed: () {
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
                      ? const [
                          Icon(Icons.add_circle_outline),
                          Text("Join", style: TextStyle(fontSize: 20)),
                        ]
                      : const [
                          Icon(Icons.add_circle_outline),
                          Text("Create", style: TextStyle(fontSize: 20)),
                        ],
                ),
              ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              body: buildQrView(context),
                            )));
              },
              icon: const Icon(Icons.qr_code_rounded))
        ],
        title: const Text(
          "QuizWAN",
          style: TextStyle(fontSize: 34),
        ),
        bottom: TabBar(
          enableFeedback: true,
          controller: tabController,
          automaticIndicatorColorAdjustment: true,
          onTap: (a) {
            setState(() {});
          },
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "HOME"),
            Tab(icon: Icon(Icons.create_new_folder), text: 'My Quizzes'),
            Tab(icon: Icon(Icons.person), text: "History"),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: TabBarView(
        children: pages,
        controller: tabController,
        // physics: NeverScrollableScrollPhysics()
      ),
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
  String roomID = '';
  List<Widget> joinOrCreate(bool joinOrCreate) => joinOrCreate
      ? [
          TextFormField(
            onChanged: (s) {
              roomID = s;
            },
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Room ID"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ]
      : [
          TextFormField(
            validator: (v) => v!.isEmpty ? 'at least 2 caracters' : null,
            onChanged: (s) {
              name = s;
            },
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: Text('Room Name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ];

  void createRoom() {
    Room room = Room(
        id: "0",
        name: name,
        creator: thisUser.id,
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

  void joinRoom(String id) async {
    Navigator.pop(context);

    Room room = await RoomCrtl.getRoomFromDBbyID(id);
    if (RoomCrtl.getAllIDOfRoomThisUser().contains(id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'You cannot join room that you created',
          ),
        ),
      );
      //  Navigator.pop(context);
    } else if (RoomCrtl.thisUserHasJoinTheRoomWithID(id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'You have completed this test',
          ),
        ),
      );
    } else if (room.id != null && room.id!.isNotEmpty) {
      Navigator.pop(context);
      // exit the Qr code scanner screen and return to the home page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnsweringRoom(
            room: room,
          ),
        ),
      ).then((value) => controller!.resumeCamera());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Incorrect information',
          ),
        ),
      );
    }
    if (cameraPaused) {
      controller!.resumeCamera();
    }
  }

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: qrViewCreated,
        onPermissionSet: (b, a) {},
        overlay: QrScannerOverlayShape(
            borderRadius: 20,
            borderLength: 40,
            borderColor: Colors.indigo,
            borderWidth: 2),
      );

  void qrViewCreated(QRViewController controller) async {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((event) {
      controller.pauseCamera();
      cameraPaused = true;

      controller.dispose();
      // dispose the controller of Qr code scanner
      joinRoom(event.code!); // join the room
    });
  }
}
