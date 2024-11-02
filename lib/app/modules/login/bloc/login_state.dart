part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  factory LoginState.initial() = Initial;
  factory LoginState.loading() = Loading;
  factory LoginState.usuarioAuthenticated(UserResponseDataModel usuario) = UsuarioAuthenticatedState;
  factory LoginState.usuarioLoaded(UserResponseDataModel usuario) = UsuarioLoaded;
  factory LoginState.authenticatedFailure(String detalle) = authenticatedFailureState;
  factory LoginState.failure(String error) = Failure;
  factory LoginState.usuarioUpdatePasswordSuccess(String response) = UsuarioUpdatePasswordSuccessState;
}
