import 'dart:math';
import 'dart:typed_data';
import "dart:ui" as ui;

import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:untitled/impots.dart';
import 'package:untitled/view/allResults.dart';

class MyQuizzes extends StatefulWidget {
  MyQuizzes({Key? key}) : super(key: key);

  @override
  State<MyQuizzes> createState() => _MyQuizzesState();
}

class _MyQuizzesState extends State<MyQuizzes> {
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return thisUser.rooms == null || thisUser.rooms!.isEmpty
        ? const Center(
            child: Text(
              "No rooms",
            ),
          )
        : FutureBuilder(
            future: UserCrtl.getRoomsOfUser(RoomCrtl.getAllIDOfRoomThisUser()),
            builder: (context, AsyncSnapshot<List<Room>> snaphot) {
              return !snaphot.hasData
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) => Card(
                        child: ExpansionTile(
                          title: ListTile(
                            contentPadding: const EdgeInsets.all(5),
                            onLongPress: () {
                              Clipboard.setData(ClipboardData(
                                      text: snaphot.data![i].password))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !')));
                              });
                            },
                            title: Text(
                              snaphot.data![i].name ?? " no name entered",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color.fromRGBO(
                                    Random().nextInt(255),
                                    Random().nextInt(255),
                                    Random().nextInt(255),
                                    0.3),
                                child: Text(
                                  '${i + 1}',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                )),
                            subtitle: Text(
                                "created on: ${snaphot.data![i].dateTime!.toString().substring(0, 16)}"),
                          ),
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Colors.indigo,
                              ),
                              subtitle: const Text('click to see results'),
                              title: Text(
                                  "${snaphot.data![i].results!.length} answer"),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllResultOfRoom(room: snaphot.data![i],)));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.edit,
                                color: Colors.indigo,
                              ),
                              title: const Text("Edit Room's Questions"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditRoom(
                                              room: snaphot.data![i],
                                            )));
                              },
                              subtitle: Text(
                                  '${snaphot.data![i].questions!.length} questions'),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.indigo,
                              ),
                              title: const Text("Delete the Quiz"),
                              onTap: () async {
                                waiting(context);
                                await RoomCrtl.deleteRoom(snaphot.data![i].id);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              subtitle: Text('click to Delete'),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.qr_code_rounded,
                                color: Colors.indigo,
                              ),
                              title: const Text("Generate Qr Code"),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RepaintBoundary(
                                        key: globalKey,
                                        child: Container(
                                          color: Colors.white,
                                          child: QrImage(
                                            size: 200,
                                            backgroundColor: Colors.white,
                                            data: snaphot.data![i].id!,
                                            eyeStyle: const QrEyeStyle(
                                                color: Colors.indigo,
                                                eyeShape: QrEyeShape.circle),
                                          ),
                                        ),
                                      ),
                                      Button(
                                        onPressed: () {
                                          qr = snaphot.data![i].name! +
                                              " QRCode Of QuizWAN";
                                          takeScreenShot(context);
                                          // saveImageToDevice(context);
                                        },
                                        icon: Icons.save_alt_rounded,
                                        text: "Save",
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      itemCount: snaphot.data!.length,
                    );
            });
  }

  String qr = "";

  _saved(Uint8List image) async {
    final result = await ImageGallerySaver.saveImage(image, name: qr);
  }

  void takeScreenShot(BuildContext context) async {
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    // We can increse the size of QR using pixel ratio
    final image = await boundary.toImage(pixelRatio: 5.0);
    final byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final pngBytes = byteData.buffer.asUint8List();
      _saved(pngBytes);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text("QR code saved to Gallery."),
      ));
    }
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
