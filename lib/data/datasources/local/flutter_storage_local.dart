// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/usuario/user_dto.dart';

class FlutterStorageLocal {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  FlutterStorageLocal();

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _KeyStorage.AUTH_TOKEN, value: token);
  }

  Future<void> saveUsuario(UserLoginDTO user) async {
    await _secureStorage.write(key: _KeyStorage.USER, value: jsonEncode(user.toJson()));
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _KeyStorage.AUTH_TOKEN);
  }

  Future<void> signOut() async {
    await _secureStorage.delete(key: _KeyStorage.AUTH_TOKEN);
  }

  Future<UserLoginDTO?> getUsuario() async {
    final result = await _secureStorage.read(key: _KeyStorage.USER);
    return result != null ? UserLoginDTO.fromJson(jsonDecode(result)) : null;
  }
}

class _KeyStorage {
  static const String AUTH_TOKEN = 'auth_token';
  static const String USER = 'user';
}
