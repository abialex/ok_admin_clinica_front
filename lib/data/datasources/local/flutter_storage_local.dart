// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:admin_clinica_front/data/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/config/key_storage.dart';
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

  Future<DoctorDto?> getDoctorSelected() async {
    try {
      final result = await _secureStorage.read(key: KeyStorage.DOCTOR);
      return result != null ? DoctorDto.fromJson(jsonDecode(result)) : null;
    } catch (e) {
      _secureStorage.deleteAll();
      return null;
    }
  }

  Future<void> saveDoctorSelected(DoctorDto doctorIdSelected) async {
    await _secureStorage.write(key: KeyStorage.DOCTOR, value: jsonEncode(doctorIdSelected.toJson()));
  }

  Future<void> clearSession() async {
    return await _secureStorage.delete(key: KeyStorage.USER);
  }
}
