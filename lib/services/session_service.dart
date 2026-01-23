import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const _keyLoggedIn = 'loggedIn';
  static const _keyUserEmail = 'userEmail';

  static Future<void> login({required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, true);
    await prefs.setString(_keyUserEmail, email);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLoggedIn);
    await prefs.remove(_keyUserEmail);
  }

  static Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
  }
}
