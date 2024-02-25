import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyUseremail = 'Useremail';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserEmail(String email) async {
    await _preferences.setString(_keyUseremail, email);
  }

  static String getUserEmail() => _preferences.getString(_keyUseremail)!;
}
