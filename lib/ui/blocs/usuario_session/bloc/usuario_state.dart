part of 'usuario_bloc.dart';

@freezed
class UsuarioState with _$UsuarioState {
  const factory UsuarioState.initial({
    @Default(false) bool isValid, //valid form
    @Default(false) bool fetching, //solicitando
    @Default(null) UsuarioLoginResponseViewModel? usuario, //solicitando
  }) = _Initial;
}
