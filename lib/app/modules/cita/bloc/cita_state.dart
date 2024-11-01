part of 'cita_bloc.dart';

@freezed
class CitaState with _$CitaState {
  const CitaState._();
  factory CitaState.initial() = Initial;
  factory CitaState.loading() = CitaLoading;
  factory CitaState.citaLoaded(List<CitaDTO> citas) = CitasLoaded;
  factory CitaState.citaOcupadaCreated() = CitaOcupadaCreated;
  factory CitaState.failure(String error) = Failure;
}
