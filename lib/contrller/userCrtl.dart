import 'package:untitled/contrller/resultCrtl.dart';
import 'package:untitled/impots.dart';

class UserCrtl {
  static User findUser(String name, String email) {
    return users.firstWhere(
        (element) => element.name == name && element.email == email);
  }

  static Future<User?> confirmPassAndGetUser(
      String name, String password) async {
    User? user = await getUserByEmailOrName(name);
    if (user.password == password) {
      return user;
    } else {
      return null;
    }
  }

  static Future<String?> postUserAndGetID(
      String name, String email, String password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String? id = await getUserByEmailOrName(email).then((value) => value.id);
    if (id == null) {
      DocumentReference? a;
      a = await users.add({
        "email": email,
        "name": name,
        "password": password,
        'rooms': [],
        "joined on": DateTime.now().toString()
      });
      id = a.id;
    }
    return id;
  }

  static Future<User> getUserFromDBbyID(
    String id,
  ) async {
    User user = User();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot a = await users.doc(id).get();
    dynamic data = a.data();
    String email = data['email'].toString();
    String name = data['name'].toString();
    String password = data['password'].toString();
    List<Room> rooms = await getRoomsOfUser(data["rooms"]);
    user = User(
        id: id, email: email, name: name, password: password, rooms: rooms);
    return user;
  }

  static Future<User> getUserByEmailOrName(String emailOrName) async {
    User user = User();
    String doc = emailOrName.contains("@") ? "email" : "name";
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot a = await users.where(doc, isEqualTo: emailOrName).get();
    if (a.docs.isNotEmpty) {
      dynamic data = a.docs.first.data();
      String email = data['email'].toString();
      String name = data['name'].toString();
      String password = data['password'].toString();
      List<Room> rooms = await getRoomsOfUser(data["rooms"]);
      List<Result> results = await ResultCrtl.getAllResultsOfThisUser();
      user = User(
          id: a.docs.first.id,
          email: email,
          name: name,
          password: password,
          rooms: rooms);
      thisUser.results = results;
    }

    return user;
  }

  static bool itMyRoomHaHaHaHa(String roomID) {
    bool b = false;
    int i = 0;
    while (!b && i < thisUser.rooms!.length) {

      if (thisUser.rooms![i].id != roomID) {
        b = true;
      }
      i++;
    }
    return b;
  }

  static Future<List<Room>> getRoomsOfUser(List<dynamic> allIDsOfRooms) async {
    List<Room> rooms = [];
    // List<String> allIDsOfRooms = data["rooms"];
    for (var value in allIDsOfRooms) {
      Room room = await RoomCrtl.getRoomFromDBbyID(value);
      rooms.add(room);
    }

    return rooms;
  }
}
