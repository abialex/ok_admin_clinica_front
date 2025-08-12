import 'package:admin_clinica_front/app/modules/login/model/update_password_request_data_model.dart';
import 'package:either_dart/either.dart';

import '../../models/usuario/authenticated_dto.dart';
import '../../models/usuario/login_user_dto.dart';
import '../../models/usuario/user_response_data_model.dart';

abstract class IUsuarioRepository {
  Future<Either<String, UserResponseDataModel>> login(LoginUserDto loginUserDto);
  Future<Either<String, AuthenticatedDTO>> authenticated(String token);
  Future<Either<String, bool>> logout();
  Future<Either<String, String>> updatePassword(UpdatePasswordRequestDataModel request);
}
