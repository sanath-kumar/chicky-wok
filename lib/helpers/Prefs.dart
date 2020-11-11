import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static Future setUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString( "USER", value);
  }

  static Future saveCart(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString( "CART", value);
  }

  static Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("USER");
  }


}