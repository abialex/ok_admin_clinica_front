import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_dto.dart';

import 'ilocal_repository.dart';
import '../../services/shared_preferences_service.dart';

class SharedPreferencesRepository implements ILocalRepository {
  final SharedPreferencesService _local;
  SharedPreferencesRepository(this._local);
  @override
  Future<String?> getToken() {
    return _local.getToken();
  }

  @override
  Future<void> saveToken(String token) {
    return _local.saveToken(token);
  }

  @override
  Future<void> saveUsuario(UserLoginDTO userLoginDTO) {
    return _local.saveUsuario(userLoginDTO);
  }

  @override
  Future<UserLoginDTO?> getUsuario() {
    return _local.getUsuario();
  }

  @override
  Future<DoctorDto?> getDoctorSelected() {
    return _local.getDoctorSelected();
  }

  @override
  Future<void> saveDoctorSelected(DoctorDto doctorIdSelected) {
    return _local.saveDoctorSelected(doctorIdSelected);
  }

  @override
  Future<void> clearSession() {
    return _local.clearSession();
  }
}
