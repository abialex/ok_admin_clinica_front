part of 'cita_hora_bloc.dart';

@freezed
class CitaHoraEvent with _$CitaHoraEvent {
  const factory CitaHoraEvent.initial(List<CitaDTO> citasViewModelList) = InitialEvent;
  const factory CitaHoraEvent.blockCita(CitaOcupadaCreateModel citaOcupadaCreateViewModel) = BlockCitaEvent;
  const factory CitaHoraEvent.releaseCita(int citaId) = ReleaseCitaEvent;
}
