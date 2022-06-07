import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:untitled/impots.dart';

class AllResultOfRoom extends StatefulWidget {
  Room? room;
  AllResultOfRoom({Key? key, this.room}) : super(key: key);

  @override
  State<AllResultOfRoom> createState() => _AllResultOfRoomState();
}

class _AllResultOfRoomState extends State<AllResultOfRoom> {
  List<Result> results = [];
  @override
  void initState() {
    // TODO: implement initState
    results = widget.room!.results!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    results = widget.room!.results!;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemBuilder: (context, i) => Card(
                child: ExpansionTile(
                  title: Text(results[i].userName!),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromRGBO(Random().nextInt(255),
                          Random().nextInt(255), Random().nextInt(255), 0.3),
                      child: Text(
                        '${i + 1}',
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                      )),
                  subtitle: Text(
                      "submitted on: ${results[i].dateTime!.toString().substring(0, 16)}"),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.sports_score,
                        color: results[i].score! >= 50.0
                            ? Colors.green
                            : Colors.indigo,
                      ),
                      title: Text("Score : ${results[i].printScore()}"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.list,
                        color: Colors.indigo,
                      ),
                      title: Text(
                          "Total Questions : ${results[i].room!.questions!.length}"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.checklist_rtl_outlined,
                        color: Colors.indigoAccent,
                      ),
                      title: Text(
                          "Total answered Questions : ${results[i].answered!.length}"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(
                          "Correct answers : ${results[i].correctAnswers().length}"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
          itemCount: results.length),
    );
  }
}
