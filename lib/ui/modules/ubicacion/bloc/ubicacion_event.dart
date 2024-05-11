part of 'ubicacion_bloc.dart';

@freezed
class UbicacionEvent with _$UbicacionEvent {
  const factory UbicacionEvent.started() = _Started;
  factory UbicacionEvent.getUbicaciones() = GetUbicaciones;
}
