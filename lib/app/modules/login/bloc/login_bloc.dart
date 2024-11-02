import 'package:admin_clinica_front/app/common/models/usuario/login_user_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/common/repository/usuario/iusuario_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginUsuario>(loginUsuario);
    on<AuthenticatedUsuarioEvent>(authenticatedUsuario);
  }

  final _localService = locator<ILocalRepository>();
  final _usuarioRepository = locator<IUsuarioRepository>();

  Future<void> loginUsuario(LoginUsuario event, Emitter<LoginState> emit) async {
    emit(Loading());
    // await Future.delayed(4.seconds);
    final result = await _usuarioRepository.login(
      LoginUserDto(
        username: event.username,
        password: event.password,
      ),
    );
    result.fold(
      (left) => emit(
        LoginState.failure(left),
      ),
      (right) => emit(
        LoginState.usuarioLoaded(right),
      ),
    );
  }

  Future<void> authenticatedUsuario(AuthenticatedUsuarioEvent event, Emitter<LoginState> emit) async {
    emit(Loading());
    // await Future.delayed(4.seconds);
    final userLogged = await _localService.getUsuario();
    if (userLogged == null) {
      emit(LoginState.authenticatedFailure("Ingrese sus credenciales"));
      return;
    }
    final result = await _usuarioRepository.authenticated(userLogged.token);
    result.fold(
      (left) => emit(LoginState.failure(left)),
      (right) {
        if (right.isValid) {
          emit(LoginState.usuarioAuthenticated(userLogged));
        } else {
          emit(LoginState.failure(right.mensaje));
        }
      },
    );
  }
}
