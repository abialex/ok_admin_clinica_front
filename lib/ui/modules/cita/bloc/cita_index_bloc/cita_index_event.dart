part of 'cita_index_bloc.dart';

@freezed
class CitaIndexEvent with _$CitaIndexEvent {
  const factory CitaIndexEvent.initial(CitasViewModel citaViewModel) = InitialEvent;
  const factory CitaIndexEvent.nextCita(CitasViewModel citaViewModel, TipoAccionEnum tipoAccion) = NextCitaEvent;
  const factory CitaIndexEvent.getCita(int citaId) = GetCitaEvent;
}
