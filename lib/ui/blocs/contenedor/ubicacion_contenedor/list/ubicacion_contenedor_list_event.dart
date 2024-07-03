part of 'ubicacion_contenedor_list_bloc.dart';

@freezed
class UbicacionContenedorListEvent with _$UbicacionContenedorListEvent {
  const UbicacionContenedorListEvent._();
  factory UbicacionContenedorListEvent.getUbicacionContenedors(FilterModel filter) = UbicacionContenedorGetAPIEvent;
  factory UbicacionContenedorListEvent.getLocalContenedors(FilterModel filter) = UbicacionContenedorGetLocalEvent;
}
