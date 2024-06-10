part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  factory LoginState.initial() = Initial;
  factory LoginState.loading() = Loading;
  factory LoginState.usuarioLoaded(UsuarioLoginResponseViewModel usuario) = UsuarioLoaded;
  factory LoginState.authenticatedFailure() = authenticatedFailureState;
  factory LoginState.failure(String error) = Failure;

  // const factory LoginState.initial({
  //   @Default(false) bool isSuccess, //valid form
  //   @Default(null) UsuarioLoginResponseViewModel? usuario, //valid form
  //   @Default(null) String? messageError,
  //   @Default(false) bool loading,

  //   //solicitando
  // }) = _Initial;
}
