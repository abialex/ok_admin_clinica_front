part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const LoginEvent._();

  const factory LoginEvent.loginUsuario(String username, String password) = LoginUsuario;
}
