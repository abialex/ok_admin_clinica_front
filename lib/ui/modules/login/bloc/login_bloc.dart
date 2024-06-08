import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/usuario_service.dart';
import 'package:admin_clinica_front/ui/view_models/usuario_view/usuario_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginUsuario>(loginUsuario);
  }

  final UsuarioService _userService = locator<UsuarioService>();
  Future<void> loginUsuario(LoginUsuario event, Emitter<LoginState> emit) async {
    emit(Loading());
    // await Future.delayed(4.seconds);
    final result = await _userService.login(
      UsuarioLoginRequestViewModel(
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
}
