part of 'ubicacion_contenedor_list_bloc.dart';

@freezed
class UbicacionContenedorListState with _$UbicacionContenedorListState {
  const UbicacionContenedorListState._();
  factory UbicacionContenedorListState.initial() = UbicacionContenedorListInitialState;
  factory UbicacionContenedorListState.loading() = UbicacionContenedorListLoadingState;
  factory UbicacionContenedorListState.ubicacionContenedorLoaded(List<UbicacionContenedorDataModel> items) = UbicacionContenedorListLoadedState;
  factory UbicacionContenedorListState.failure(String error) = UbicacionContenedorListErrorState;
}
