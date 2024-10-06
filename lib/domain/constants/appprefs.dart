import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  SharedPreferences? prefs;
  Future<void> initprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setprefs(String token) async {
    await initprefs();
    prefs!.setString("token", token);
  }

  Future<void> setuserId(String userid) async {
    await initprefs();
    prefs!.setString("userid", userid);
  }

  Future<String> getuserId() async {
    await initprefs();
    return prefs!.getString("userid") ?? "";
  }

  Future<String> getprefs() async {
    await initprefs();
    return prefs!.getString("token") ?? "";
  }

  Future<void> setBool(bool value) async {
    await initprefs();
    prefs!.setBool("islogin", value);
  }

  Future<bool> getBool() async {
    await initprefs();
    return prefs!.getBool("islogin") ?? false;
  }
}
