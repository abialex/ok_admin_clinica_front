part of 'ubicacion_bloc.dart';

@freezed
class UbicacionState with _$UbicacionState {
  const UbicacionState._();
  factory UbicacionState.initial() = Initial;
  factory UbicacionState.loading() = Loading;
  factory UbicacionState.ubicacionLoaded(List<UbicacionDto> ubicaciones) = UbicacionLoaded;
  factory UbicacionState.failure(String error) = Failure;
}
