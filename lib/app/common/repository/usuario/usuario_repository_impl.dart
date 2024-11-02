import 'package:admin_clinica_front/app/common/models/usuario/authenticated_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/login_user_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/common/repository/usuario/iusuario_repository.dart';
import 'package:either_dart/either.dart';
import '../../service/usuario_api.dart';

class UsuarioRepository implements IUsuarioRepository {
  UsuarioApi _api;
  UsuarioRepository(this._api);

  @override
  Future<Either<String, AuthenticatedDTO>> authenticated(String token) async {
    return await _api.authenticated(token);
  }

  @override
  Future<Either<String, UserResponseDataModel>> login(LoginUserDto loginUserDto) async {
    return await _api.login(loginUserDto);
  }

  @override
  Future<Either<String, bool>> logout() async {
    return await _api.logout();
  }
}
