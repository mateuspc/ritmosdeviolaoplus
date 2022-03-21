import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  static Future<bool> isUserPro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isPro') ?? false;
  }

  static Future<void> setUserPro(bool isPro) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPro', isPro);
  }

}