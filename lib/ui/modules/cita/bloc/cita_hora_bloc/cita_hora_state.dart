part of 'cita_hora_bloc.dart';

@freezed
class CitaHoraState with _$CitaHoraState {
  const CitaHoraState._();
  factory CitaHoraState.initial() = InitialState;
  factory CitaHoraState.loading() = LoadingState;
  factory CitaHoraState.citaBloqueada(int citaId) = CitaBloqueadaState;
  factory CitaHoraState.citaLibre(List<CitasViewModel> cita) = CitaLibreLoadedState;

  factory CitaHoraState.failure(String error) = Failure;
}
