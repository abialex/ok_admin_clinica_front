part of 'usuario_bloc.dart';

@freezed
class UsuarioEvent with _$UsuarioEvent {
  const factory UsuarioEvent.started() = _Started;
  const factory UsuarioEvent.setupUsuario(UserResponseDataModel? usuario) = SetupUsuarioEvent;
  const factory UsuarioEvent.setUsuario(UserResponseDataModel usuario) = SetUsuarioEvent;
  const factory UsuarioEvent.setDoctorSelected(DoctorDto doctorIdSelected) = SetDoctorSelectedEvent;
  const factory UsuarioEvent.setupDoctorSelected(DoctorDto? doctorIdSelected) = SetupDoctorSelectedEvent;
}
