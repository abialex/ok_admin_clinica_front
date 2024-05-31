import 'package:admin_clinica_front/data/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';

abstract class ILocalRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUsuario(UserLoginDTO userLoginDTO);
  Future<UserLoginDTO?> getUsuario();
  Future<void> saveDoctorSelected(DoctorDto doctorSelected);
  Future<DoctorDto?> getDoctorSelected();
}
