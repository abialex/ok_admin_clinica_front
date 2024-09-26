// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:admin_clinica_front/data/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/config/key_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/usuario/user_dto.dart';

class SharedPreferencesLocal {
  final SharedPreferences _sharedPreferences;
  SharedPreferencesLocal(this._sharedPreferences);

  Future<void> saveToken(String token) async {
    _sharedPreferences.setString(KeyStorage.AUTH_TOKEN, token);
    // await preferences.setString(_KeyStorage.AUTH_TOKEN, token);
  }

  Future<void> saveUsuario(UserLoginDTO userLoginDTO) async {
    String jsonString = json.encode(userLoginDTO.toJson());
    _sharedPreferences.setString(KeyStorage.USER, jsonString);

    // await preferences.write(key: _KeyStorage.USER, value: "user");
  }

  Future<UserLoginDTO?> getUsuario() async {
    final result = _sharedPreferences.getString(KeyStorage.USER);
    if (result == null) return null;
    return UserLoginDTO.fromJson(jsonDecode(result));
  }

  Future<String?> getToken() async {
    return _sharedPreferences.getString(KeyStorage.AUTH_TOKEN);
  }

  Future<void> signOut() async {
    // await preferences.delete(key: _KeyStorage.AUTH_TOKEN);
  }

  Future<void> saveDoctorSelected(DoctorDto doctor) async {
    String jsonString = json.encode(doctor.toJson());
    _sharedPreferences.setString(KeyStorage.DOCTOR, jsonString);
  }

  Future<DoctorDto?> getDoctorSelected() async {
    try {
      final result = _sharedPreferences.getString(KeyStorage.DOCTOR);
      if (result == null) return null;
      return DoctorDto.fromJson(jsonDecode(result));
    } catch (e) {
      _sharedPreferences.clear();
      return null;
    }
  }

  Future<void> clearSession() async {
    _sharedPreferences.remove(KeyStorage.USER);
  }
}
