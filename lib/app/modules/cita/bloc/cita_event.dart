part of 'cita_bloc.dart';

@freezed
class CitaEvent with _$CitaEvent {
  const CitaEvent._();
  factory CitaEvent.blockCita(CitaOcupadaCreateModel citaRequestViewModel) = BlockCitasEvent;
  factory CitaEvent.freeCita(int citaId) = FreeCitasEvent;

  factory CitaEvent.getCitas(CitaRequest citaRequestViewModel) = GetCitas;
  factory CitaEvent.invalidCita(String message) = InvalidCitaEvent;
}
