import 'package:either_dart/either.dart';

import '../../data/models/usuario/authenticated_dto.dart';
import '../../data/models/usuario/login_user_dto.dart';
import '../../data/models/usuario/user_dto.dart';

abstract class IUsuarioRepository {
  Future<Either<String, UserLoginDTO>> login(LoginUserDto loginUserDto);
  Future<Either<String, AuthenticatedDTO>> authenticated(String token);
  Future<Either<String, bool>> logout();
}
