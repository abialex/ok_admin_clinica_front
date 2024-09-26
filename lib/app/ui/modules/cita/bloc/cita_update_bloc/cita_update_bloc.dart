// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_event.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitaUpdateBloc extends Bloc<CitaUpdateEvent, CitaUpdateState> {
  CitaUpdateBloc() : super(CitaUpdateState.initial()) {
    on<CitaUpdateErrorEvent>(error);
    on<CitaAgilUpdateEvent>(updateCita);
    on<CitaGetByIdEvent>(getCitaById);

    // on<CitaCreateLocalEvent>(createLocalCitas);
  }

  final CitasService _citaService = locator<CitasService>();

  Future<void> updateCita(CitaAgilUpdateEvent event, Emitter<CitaUpdateState> emit) async {
    emit(CitaUpdateLoadingState());
    final result = await _citaService.citaAgilUpdate(event.model);
    if (result.isRight) {
      emit(CitaUpdateSuccessState(result.right, event.model.doctorId, [event.model.ubicacionId], event.model.fechaHoraCita));
    } else {
      emit(CitaUpdateErrorState(result.left));
    }
  }

  Future<void> error(CitaUpdateErrorEvent event, Emitter<CitaUpdateState> emit) async {
    emit(CitaUpdateState.failure(event.error));
  }

  Future<void> getCitaById(CitaGetByIdEvent event, Emitter<CitaUpdateState> emit) async {
    emit(CitaUpdateState.loading());
    final result = await _citaService.getCitaById(event.citaId);
    if (result.isRight) {
      return emit(CitaUpdateState.citaAgilSetup(result.right));
    } else {
      return emit(CitaUpdateState.failure(result.left));
    }
  }
}
