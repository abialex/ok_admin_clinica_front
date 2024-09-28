import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/mappers/citas_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_index_event.dart';
part 'cita_index_state.dart';
part 'cita_index_bloc.freezed.dart';

class CitaIndexBloc extends Bloc<CitaIndexEvent, CitaIndexState> {
  CitaIndexBloc() : super(CitaIndexState.initial()) {
    on<InitialEvent>(initial);
    on<NextCitaEvent>(nextCita);
    on<GetCitaEvent>(getCitaById);
    on<EliminarCitaEvent>(eliminarCita);
  }

  final citaService = locator<CitasService>();

  Future<void> initial(InitialEvent event, Emitter<CitaIndexState> emit) async {
    // emit(Loading());
    emit(CitaIndexState.citaLoaded(event.citaViewModel));
  }

  Future<void> nextCita(NextCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final cita = event.citaViewModel;

    final result = await citaService.nextPaso(event.tipoAccion, cita.id);
    if (result.isRight) {
      add(CitaIndexEvent.getCita(cita.id));
    } else {
      emit(Failure(result.left));
    }
  }

  Future<void> getCitaById(GetCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final result = await citaService.getCitaById(event.citaId);
    if (result.isRight) {
      final citasViewModel = result.right;
      emit(
        CitaLoaded(
          CitasViewModel(
            id: citasViewModel.id,
            fechaHoraCita: citasViewModel.fechaHoraCita,
            estado: citasViewModel.estado,
            tipo: citasViewModel.tipo,
            estadoString: citasViewModel.estadoString,
            tipoString: citasViewModel.tipoString,
            celular: citasViewModel.celular,
            datosPaciente: citasViewModel.datosPaciente,
            fechaConfirmacion: citasViewModel.fechaConfirmacion,
            fechaFin: citasViewModel.fechaFin,
            fechaInicio: citasViewModel.fechaInicio,
            fechaValidacion: citasViewModel.fechaValidacion,
            pacienteDatos: citasViewModel.pacienteDatos,
            razon: citasViewModel.razon,
            razonOcupado: citasViewModel.razonOcupado,
          ),
        ),
      );
    } else {
      emit(Failure(result.left));
    }
  }

  Future<void> eliminarCita(EliminarCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final cita = event.citaViewModel;

    final result = await citaService.deleteCitaById(event.citaViewModel.id);
    if (result.isRight) {
      emit(CitaIndexState.citaEliminada(cita));
    } else {
      emit(Failure(result.left));
    }
  }
}
