// ignore_for_file: constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage;

  AuthService(this._secureStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _KeyStorage.AUTH_TOKEN, value: token);
  }

  Future<void> saveUser(String token) async {
    await _secureStorage.write(key: _KeyStorage.USER, value: "user");
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _KeyStorage.AUTH_TOKEN);
  }

  Future<void> signOut() async {
    await _secureStorage.delete(key: _KeyStorage.AUTH_TOKEN);
  }
}

class _KeyStorage {
  static const String AUTH_TOKEN = 'auth_token';
  static const String USER = 'user';
}
