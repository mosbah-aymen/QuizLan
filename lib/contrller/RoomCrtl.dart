import 'dart:math';

import 'package:untitled/contrller/questionCrtl.dart';
import 'package:untitled/contrller/resultCrtl.dart';
import 'package:untitled/impots.dart';

class RoomCrtl {
  static String generatePassword() {
    String s = "";
    Random random = Random();
    while (s.length < 5) {
      int a = random.nextInt(10);
      s += "$a";
    }
    return s;
  }

  static Room findRoom(String id) {
    Room room = Room();
    if (thisUser.rooms!.isNotEmpty) {
      for (var element in thisUser.rooms!) {
        if (element.id == id) {
          room = element;

          return room;
        }
      }
    } else {}
    return room;
  }

  static bool hasCorrectInformations(String name, String password) {
    return findRoom(name).password == password && password.isNotEmpty;
  }

  // static Future<List<Room>> getAllRoomsOfThisUser() {
  //   List<Room> rooms = [];
  //
  //   return rooms;
  // }

  static Future<String> createNewRoomAndGetId(
      String name, List<Question> questions) async {
    CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');

    DocumentReference? a;
    a = await rooms.add({
      "name": name,
      "password": generatePassword(),
      'users': [],
      'creator': thisUser.name,
      'questions': QuestionCrtl.getMapFromQuestions(questions),
      "created on": DateTime.now().toString(),
    });
    thisUser.rooms!.add(Room(id: a.id));
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    List<String> newRefOfRooms = getAllIDOfRoomThisUser();
    users.doc(thisUser.id).update({'rooms': newRefOfRooms});
    return a.id;
  }

  static List<String> getAllIDOfRoomThisUser() {
    List<String> tmp = [];
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    // var a = await users.get().then((value) => value.docs);
    // dynamic z = a.first.data();
    // tmp = z["rooms"];
    for (var value in thisUser.rooms!) {
      tmp.add(value.id!);
    }

    return tmp;
  }

  static Future<Room> getRoomFromDBbyID(String id) async {
    Room room = Room();
    CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');
    DocumentSnapshot a = await rooms.doc(id).get();
    dynamic data = a.data();

    String creator = data['creator'].toString();
    String name = data['name'].toString();
    List<Question> questions =
        QuestionCrtl.getQuestionsFromMap(data["questions"]);
    DateTime dateTime = DateTime.parse(data["created on"].toString());
    List<Result> results = await ResultCrtl.getAllResultsOfRoom(id);

    room = Room(
      id: id,
      name: name,
      password: id,
      creator: creator,
      questions: questions,
      dateTime: dateTime,
      results: results,
      users: [],
    );
    return room;
  }

  static void addUserToRoom(userId, Room r) async {
    r.users!.add(userId);
    DocumentReference<Map<String, dynamic>> room =
        FirebaseFirestore.instance.collection('rooms').doc(r.id);
    await room.update({"users": r.users!});
  }

  static Future updateRoom(Room r) async {
    DocumentReference<Map<String, dynamic>> room =
        FirebaseFirestore.instance.collection('rooms').doc(r.id);
    await room.update({
      "name": r.name,
      "password": r.password,
      'users': r.users,
      'creator': r.creator,
      'questions': QuestionCrtl.getMapFromQuestions(r.questions!),
      "created on": DateTime.now().toString()
    });
  }

  static Future deleteRoom(roomID) async {
    List<Room> ids = [];
    for (var element in thisUser.rooms!) {
      if (element.id != roomID) {
        ids.add(element);
      }
    }
    thisUser.rooms = ids;

    DocumentReference<Map<String, dynamic>> room =
        FirebaseFirestore.instance.collection('rooms').doc(roomID);
    await room
        .delete()
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
    DocumentReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users').doc(thisUser.id);
    await user.update({"rooms": getAllIDOfRoomThisUser()});
  }

  static bool thisUserHasJoinTheRoomWithID(roomId) {
    bool b = false;
    for (var element in thisUser.results!) {
      if (element.room!.id == roomId) {
        b = true;
        break;
      }
    }
    return b;
  }
}
