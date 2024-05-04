// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/usuario/user_dto.dart';

class SharedPreferencesLocal {
  final preferences = SharedPreferences.getInstance();
  SharedPreferencesLocal();

  Future<void> saveToken(String token) async {
    // final preferences = await SharedPreferences.getInstance();
    preferences.then((value) => value.setString(_KeyStorage.AUTH_TOKEN, token));
    // await preferences.setString(_KeyStorage.AUTH_TOKEN, token);
  }

  Future<void> saveUsuario(UserLoginDTO userLoginDTO) async {
    String jsonString = json.encode(userLoginDTO.toJson());
    preferences.then((value) => value.setString(_KeyStorage.USER, jsonString));

    // await preferences.write(key: _KeyStorage.USER, value: "user");
  }

  Future<UserLoginDTO?> getUsuario() async {
    final result = await preferences.then((value) => value.getString(_KeyStorage.USER));
    if (result == null) return null;
    return UserLoginDTO.fromJson(jsonDecode(result));
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
  static const String USER = 'user';
}
