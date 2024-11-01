// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_state.dart';
import 'package:bloc/bloc.dart';

class CitaCreateBloc extends Bloc<CitaCreateEvent, CitaCreateState> {
  CitaCreateBloc() : super(CitaCreateState.initial()) {
    on<CitaAgilCreateEvent>(createCita);
    on<CitaAgilPreCreateEvent>(preCreateCita);
    on<CitaCreateErrorEvent>(error);
    // on<CitaCreateLocalEvent>(createLocalCitas);
  }

  final citaRepository = locator.get<ICitaRepository>();

  Future<void> createCita(CitaAgilCreateEvent event, Emitter<CitaCreateState> emit) async {
    emit(CitaCreateLoadingState());
    final result = await citaRepository.createCitaAgil(event.model);
    if (result.isRight) {
      emit(CitaCreateSuccessState(result.right, event.model.doctorId, [event.model.ubicacionId], event.model.fechaHoraCitaDate));
    } else {
      emit(CitaCreateErrorState(result.left));
    }
  }

  Future<void> preCreateCita(CitaAgilPreCreateEvent event, Emitter<CitaCreateState> emit) async {
    emit(CitaCreateState.citaUploadPreDatos(event.doctorDatos, event.fechaCita, event.hora, event.horaString));
  }

  Future<void> error(CitaCreateErrorEvent event, Emitter<CitaCreateState> emit) async {
    emit(CitaCreateState.failure(event.error));
  }
}
