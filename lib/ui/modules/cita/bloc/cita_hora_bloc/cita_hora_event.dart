part of 'cita_hora_bloc.dart';

@freezed
class CitaHoraEvent with _$CitaHoraEvent {
  const factory CitaHoraEvent.initial(List<CitasViewModel> citasViewModelList) = InitialEvent;
  const factory CitaHoraEvent.blockCita(CitaOcupadaCreateViewModel citaOcupadaCreateViewModel) = BlockCitaEvent;
  const factory CitaHoraEvent.releaseCita(int citaId) = ReleaseCitaEvent;
}
