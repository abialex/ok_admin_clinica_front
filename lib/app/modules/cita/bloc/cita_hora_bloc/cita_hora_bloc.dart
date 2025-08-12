import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/entities/tipo_cita.dart';
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

  final citaRepository = locator<ICitaRepository>();

  Future<void> initial(InitialEvent event, Emitter<CitaHoraState> emit) async {
    final citaList = event.citasViewModelList;
    final existsCitaOcupada = citaList.any((element) => element.tipoEnum == TipoCita.ocupada);
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
    final result = await citaRepository.createCitaOcupada(event.citaOcupadaCreateViewModel);
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
    final result = await citaRepository.deleteCitaById(event.citaId);
    if (result.isRight) {
      emit(CitaHoraState.citaLibre([]));
    } else {
      emit(CitaHoraState.failure(result.left));
    }
  }
}
