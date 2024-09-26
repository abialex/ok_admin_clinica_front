part of 'cita_bloc.dart';

@freezed
class CitaState with _$CitaState {
  const CitaState._();
  factory CitaState.initial() = Initial;
  factory CitaState.loading() = Loading;
  factory CitaState.citaLoaded(List<CitasViewModel> citas) = CitasLoaded;
  factory CitaState.failure(String error) = Failure;
}
