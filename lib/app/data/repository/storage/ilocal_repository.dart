import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_dto.dart';

abstract class ILocalRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUsuario(UserLoginDTO userLoginDTO);
  Future<UserLoginDTO?> getUsuario();
  Future<void> saveDoctorSelected(DoctorDto doctorSelected);
  Future<DoctorDto?> getDoctorSelected();
  Future<void> clearSession();
}
