import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';

abstract class ILocalRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUsuario(UserResponseDataModel userLoginDTO);
  Future<UserResponseDataModel?> getUsuario();
  Future<void> saveDoctorSelected(DoctorDto doctorSelected);
  Future<DoctorDto?> getDoctorSelected();
  Future<void> clearSession();
}
