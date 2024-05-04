part of 'usuario_bloc.dart';

@freezed
class UsuarioEvent with _$UsuarioEvent {
  const factory UsuarioEvent.started() = _Started;
  const factory UsuarioEvent.setupUsuario(UsuarioLoginResponseViewModel? usuario) = SetupUsuarioEvent;
  const factory UsuarioEvent.setUsuario(UsuarioLoginResponseViewModel usuario) = SetUsuarioEvent;
}
