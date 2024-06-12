import 'package:admin_clinica_front/data/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';

import '../../dominio/repositories/ilocal_repository.dart';
import '../datasources/local/flutter_storage_local.dart';

class FlutterStorageRepository implements ILocalRepository {
  final FlutterStorageLocal _local;
  FlutterStorageRepository(this._local);

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
    // TODO: implement getUsuario
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
