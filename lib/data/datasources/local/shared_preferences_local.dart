// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocal {
  final preferences = SharedPreferences.getInstance();
  SharedPreferencesLocal();

  Future<void> saveToken(String token) async {
    // final preferences = await SharedPreferences.getInstance();
    preferences.then((value) => value.getString(_KeyStorage.AUTH_TOKEN));
    // await preferences.setString(_KeyStorage.AUTH_TOKEN, token);
  }

  Future<void> saveUser(String token) async {
    // await preferences.write(key: _KeyStorage.USER, value: "user");
  }

  Future<String?> getToken() async {
    // final preferences = SharedPreferences.getInstance();
    return preferences.then((value) => value.getString(_KeyStorage.AUTH_TOKEN));
  }

  Future<void> signOut() async {
    // await preferences.delete(key: _KeyStorage.AUTH_TOKEN);
  }
}

class _KeyStorage {
  static const String AUTH_TOKEN = 'auth_token';
  // static const String USER = 'user';
}
