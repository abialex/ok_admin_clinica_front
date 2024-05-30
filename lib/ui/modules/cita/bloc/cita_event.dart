part of 'cita_bloc.dart';

@freezed
class CitaEvent with _$CitaEvent {
  const CitaEvent._();
  factory CitaEvent.getCitas(CitaRequestViewModel citaRequestViewModel) = GetCitas;
}
