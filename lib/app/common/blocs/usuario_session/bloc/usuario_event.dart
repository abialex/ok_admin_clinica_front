part of 'usuario_bloc.dart';

@freezed
class UsuarioEvent with _$UsuarioEvent {
  const factory UsuarioEvent.started() = _Started;
  const factory UsuarioEvent.setupUsuario(UserLoginDTO? usuario) = SetupUsuarioEvent;
  const factory UsuarioEvent.setUsuario(UserLoginDTO usuario) = SetUsuarioEvent;
  const factory UsuarioEvent.setDoctorSelected(DoctorDto doctorIdSelected) = SetDoctorSelectedEvent;
  const factory UsuarioEvent.setupDoctorSelected(DoctorDto? doctorIdSelected) = SetupDoctorSelectedEvent;
}
