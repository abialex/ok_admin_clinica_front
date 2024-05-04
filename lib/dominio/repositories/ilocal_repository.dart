import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';

abstract class ILocalRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUsuario(UserLoginDTO userLoginDTO);
  Future<UserLoginDTO?> getUsuario();
}
