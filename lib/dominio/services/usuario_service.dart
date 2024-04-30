import 'package:either_dart/either.dart';

import '../../data/models/usuario/login_user_dto.dart';
import '../../ui/view_models/usuario_view/usuario_view_models.dart';
import '../repositories/iusuario_repository.dart';

class UsuarioService {
  final IUsuarioRepository _usuarioRepository;
  UsuarioService(this._usuarioRepository);
  Future<Either<String, UsuarioLoginResponseViewModel>> login(
      UsuarioLoginRequestViewModel loginUserDto) async {
    try {
      LoginUserDto model = LoginUserDto(
        username: loginUserDto.username,
        password: loginUserDto.password,
      );
      final result = _usuarioRepository.login(model);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          UsuarioLoginResponseViewModel(
            userId: right.user_id,
            isNewToken: right.is_new_token,
            diasToken: right.dias_token,
            nombres: right.nombres,
            token: right.token,
            rol: right.rol,
            username: right.username,
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, UsuarioAuthenticatedViewModel>> authenticated(
      String token) async {
    try {
      final result = _usuarioRepository.authenticated(token);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          UsuarioAuthenticatedViewModel(
            mensaje: right.mensaje,
            isValido: right.isValid,
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      return _usuarioRepository.logout();
    } catch (e) {
      return const Left("Error inesperado");
    }
  }
}
