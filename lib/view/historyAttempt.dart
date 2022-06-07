import 'dart:math';

import 'package:untitled/impots.dart';
import 'package:untitled/view/correction.dart';

class HistoryAttempt extends StatefulWidget {
  const HistoryAttempt({Key? key}) : super(key: key);
  @override
  State<HistoryAttempt> createState() => _HistoryAttemptState();
}

class _HistoryAttemptState extends State<HistoryAttempt> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: thisUser.results!.isEmpty
          ? Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have not complete any test, yet.",
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Refresh"))
                  ],
                ),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Card(
                  child: ExpansionTile(
                    title: ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      title: Text(
                        thisUser.results![i].room!.name ?? " no name entered",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
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
                          "submitted on: ${(thisUser.results![i].dateTime!.toString().substring(0, 10))} "
                          "\n                    at: ${(thisUser.results![i].dateTime!.toString().substring(11, 16))}"),
                    ),
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.sports_score,
                          color: Colors.indigo,
                        ),
                        title: Text(
                            "Score : ${thisUser.results![i].printScore()}"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.list,
                          color: Colors.indigo,
                        ),
                        title: Text(
                            "Questions : ${thisUser.results![i].room!.questions!.length}"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.list,
                          color: Colors.indigo,
                        ),
                        title: Text(
                            "created By : ${thisUser.results![i].room!.creator}"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.done_all,
                          color: Colors.green,
                        ),
                        title: const Text("click to see the correction"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Correction(
                                        room: thisUser.results![i].room,
                                        answered: thisUser.results![i].answered,
                                      )));
                        },
                      ),
                    ],
                  ),
                );
              },
              itemCount: thisUser.results!.length,
            ),
    );
  }
}
