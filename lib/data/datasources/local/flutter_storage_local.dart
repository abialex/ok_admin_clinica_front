// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:admin_clinica_front/data/utils/key_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/usuario/user_dto.dart';

class FlutterStorageLocal {
  final FlutterSecureStorage _secureStorage;

  FlutterStorageLocal(this._secureStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: KeyStorage.AUTH_TOKEN, value: token);
  }

  Future<void> saveUsuario(UserLoginDTO user) async {
    await _secureStorage.write(key: KeyStorage.USER, value: jsonEncode(user.toJson()));
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: KeyStorage.AUTH_TOKEN);
  }

  Future<void> signOut() async {
    await _secureStorage.delete(key: KeyStorage.AUTH_TOKEN);
  }

  Future<UserLoginDTO?> getUsuario() async {
    final result = await _secureStorage.read(key: KeyStorage.USER);
    return result != null ? UserLoginDTO.fromJson(jsonDecode(result)) : null;
  }
}
