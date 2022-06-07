import 'package:untitled/impots.dart';

class Pref {
  static void saveUserId(String id) async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _pref;
    await prefs.setString('thisUserID', id);
  }

  static Future<String?> getUserID() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.getString("thisUserID");
  }
}
