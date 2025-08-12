part of 'cita_index_bloc.dart';

@freezed
class CitaIndexState with _$CitaIndexState {
  const CitaIndexState._();
  factory CitaIndexState.initial() = Initial;
  factory CitaIndexState.loading() = Loading;
  factory CitaIndexState.citaLoaded(CitaDTO cita) = CitaLoaded;
  factory CitaIndexState.citaEliminada(CitaDTO cita) = CitaEliminada;
  factory CitaIndexState.failure(String error) = Failure;
}
