import 'package:untitled/impots.dart';

class ResultCrtl {
  static Future<String> addResultOfThisUserInRoom(Result result) async {
    CollectionReference results =
        FirebaseFirestore.instance.collection('results');

    DocumentReference? a;
    a = await results.add({
      "userID": result.userID,
      "userName": result.userName,
      "roomID": result.room!.id,
      'answered': result.answered,
      'answeredOn': result.dateTime.toString(),
      'score': result.theScore()!.toInt(),
    });

    thisUser.results!.add(result);

    return a.id;
  }

  static Future<List<Result>> getAllResultsOfThisUser() async {
    List<Result> allResults = [];

    CollectionReference results =
        FirebaseFirestore.instance.collection('results');

    QuerySnapshot<Object?> a =
        await results.where("userID", isEqualTo: thisUser.id).get();

    a.docs.forEach((element) async {
      dynamic data = element.data();
      Room room = await RoomCrtl.getRoomFromDBbyID(data["roomID"]);
      Result result = Result(
        id: element.id,
        userName: thisUser.name,
        userID: thisUser.id,
        room: room,
        score: double.parse(data["score"].toString()),
        dateTime: DateTime.parse(data["answeredOn"].toString()),
        answered: getListOfIntFromListOfString(data["answered"]),
      );
      allResults.add(result);
    });
    thisUser.results = allResults;
    return allResults;
  }

  static Future<List<Result>> getAllResultsOfRoom(String roomID) async {
    List<Result> allResults = [];
    Room room = RoomCrtl.findRoom(roomID);

    CollectionReference results =
        FirebaseFirestore.instance.collection('results');

    QuerySnapshot<Object?> a =
        await results.where("roomID", isEqualTo: roomID).get();

    a.docs.forEach((element) async {
      dynamic data = element.data();
      // room = await RoomCrtl.getRoomFromDBbyID(data["roomID"]);
      Result result = Result(
        id: element.id,
        userName: data["userName"].toString(),
        userID: data["userID"].toString(),
        room: room,
        score: double.parse(data["score"].toString()),
        dateTime: DateTime.parse(data["answeredOn"].toString()),
        answered: getListOfIntFromListOfString(data["answered"]),
      );
      allResults.add(result);
    });
    room.results = allResults;

    return allResults;
  }

  static List<int> getListOfIntFromListOfString(List list) {
    List<int> result = [];
    for (var value in list) {
      result.add(int.parse(value.toString()));
    }

    return result;
  }
}

void getResults() async {
  thisUser.results = await ResultCrtl.getAllResultsOfThisUser();
}
