import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/entities/tipo_cita.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
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
      emit(CitaHoraState.citaBloqueada(citaList[0].id));
    } else {
      emit(CitaHoraState.citaLibre(citaList));
    }
  }

  Future<void> blockCita(BlockCitaEvent event, Emitter<CitaHoraState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    // final cita = event.citaViewModel;

    // final result = await citaService.nextPaso(event.tipoAccion, cita.id);
    // if (result.isRight) {
    //   add(CitaHoraEvent.releaseCita(cita.id));
    // } else {
    //   emit(Failure(result.left));
    // }
  }

  Future<void> releaseCita(ReleaseCitaEvent event, Emitter<CitaHoraState> emit) async {
    emit(LoadingState());
    // final result = await citaService.getCitaById(event.citaId);
    // if (result.isRight) {
    //   final citasViewModel = result.right;
    //   emit(
    //     CitaLibreLoadedState(
    //       CitasViewModel(
    //         id: citasViewModel.id,
    //         fechaHoraCita: citasViewModel.fechaHoraCita,
    //         estado: citasViewModel.estado,
    //         tipo: citasViewModel.tipo,
    //         estadoString: citasViewModel.estadoString,
    //         tipoString: citasViewModel.tipoString,
    //         celular: citasViewModel.celular,
    //         datosPaciente: citasViewModel.datosPaciente,
    //         fechaConfirmacion: citasViewModel.fechaConfirmacion,
    //         fechaFin: citasViewModel.fechaFin,
    //         fechaInicio: citasViewModel.fechaInicio,
    //         fechaValidacion: citasViewModel.fechaValidacion,
    //         pacienteDatos: citasViewModel.pacienteDatos,
    //         razon: citasViewModel.razon,
    //         razonOcupado: citasViewModel.razonOcupado,
    //       ),
    //     ),
    //   );
    // } else {
    //   emit(Failure(result.left));
    // }
  }
}
