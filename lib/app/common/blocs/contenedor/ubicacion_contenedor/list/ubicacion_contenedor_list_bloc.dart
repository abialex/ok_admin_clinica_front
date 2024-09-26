import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/models/filter_model/filter_model.dart';
import 'package:admin_clinica_front/app/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/dominio/repositories/idubicacion_contenedor/iubicacion_contenedor_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ubicacion_contenedor_list_event.dart';
part 'ubicacion_contenedor_list_state.dart';
part 'ubicacion_contenedor_list_bloc.freezed.dart';

class UbicacionContenedorListBloc extends Bloc<UbicacionContenedorListEvent, UbicacionContenedorListState> {
  final ubicacionContenedorRepository = locator.get<IUbicacionContenedorLocalRepository>();
  UbicacionContenedorListBloc() : super(UbicacionContenedorListState.initial()) {
    on<UbicacionContenedorGetAPIEvent>(getContenedors);
  }

  Future<void> getContenedors(UbicacionContenedorGetAPIEvent event, Emitter<UbicacionContenedorListState> emit) async {
    emit(UbicacionContenedorListLoadingState());
    final result = await ubicacionContenedorRepository.getLocalSunatContenedors();
    if (result.isRight) {
      emit(UbicacionContenedorListLoadedState(result.right));
    } else {
      emit(UbicacionContenedorListErrorState(result.left));
    }
  }
}
