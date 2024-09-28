import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/entities/tipo_cita.dart';
import 'package:admin_clinica_front/app/common/mappers/citas_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_hora_event.dart';
part 'cita_hora_state.dart';
part 'cita_hora_bloc.freezed.dart';

class CitaHoraBloc extends Bloc<CitaHoraEvent, CitaHoraState> {
  CitaHoraBloc() : super(CitaHoraState.initial()) {
    on<InitialEvent>(initial);
    on<BlockCitaEvent>(blockCita);
    on<ReleaseCitaEvent>(releaseCita);
  }

  final citaService = locator<CitasService>();

  Future<void> initial(InitialEvent event, Emitter<CitaHoraState> emit) async {
    final citaList = event.citasViewModelList;
    final existsCitaOcupada = citaList.any((element) => element.tipo == TipoCita.ocupada);
    emit(LoadingState());
    if (existsCitaOcupada) {
      emit(
        CitaHoraState.citaBloqueada(
          citaList[0].id,
          citaList[0].razonOcupado,
        ),
      );
    } else {
      emit(CitaHoraState.citaLibre(citaList));
    }
  }

  Future<void> blockCita(BlockCitaEvent event, Emitter<CitaHoraState> emit) async {
    emit(LoadingState());
    //*create cita ocupada
    final result = await citaService.citaOcupadaCreate(event.citaOcupadaCreateViewModel);
    if (result.isRight) {
      emit(CitaHoraState.citaBloqueada(
        result.right,
        event.citaOcupadaCreateViewModel.razonOcupado,
      ));
    } else {
      emit(CitaHoraState.failure(result.left));
    }
  }

  Future<void> releaseCita(ReleaseCitaEvent event, Emitter<CitaHoraState> emit) async {
    emit(LoadingState());
    final result = await citaService.deleteCitaById(event.citaId);
    if (result.isRight) {
      emit(CitaHoraState.citaLibre([]));
    } else {
      emit(CitaHoraState.failure(result.left));
    }
  }
}
