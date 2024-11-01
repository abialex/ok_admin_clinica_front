import 'package:admin_clinica_front/app/common/enums/tipo_accion_enum.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
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

  final citaRepository = locator.get<ICitaRepository>();

  Future<void> initial(InitialEvent event, Emitter<CitaIndexState> emit) async {
    // emit(Loading());
    emit(CitaIndexState.citaLoaded(event.citaViewModel));
  }

  Future<void> nextCita(NextCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final cita = event.citaViewModel;
    late Either<String, bool> result;
    switch (event.tipoAccion) {
      case TipoAccionEnum.confirmar:
        result = await citaRepository.confirmarCita(cita.id);
      case TipoAccionEnum.iniciar:
        result = await citaRepository.iniciarCita(cita.id);
      case TipoAccionEnum.finalizar:
        result = await citaRepository.finalizarCita(cita.id);
      case TipoAccionEnum.validar:
        result = await citaRepository.validarCita(cita.id);
      case TipoAccionEnum.cancelar:
        result = await citaRepository.cancelarCita(cita.id);
      default:
        return emit(Failure('acción no definida'));
    }

    if (result.isRight) {
      add(CitaIndexEvent.getCita(cita.id));
    } else {
      emit(Failure(result.left));
    }
  }

  Future<void> getCitaById(GetCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final result = await citaRepository.getCitaById(event.citaId);
    if (result.isRight) {
      final citasViewModel = result.right;
      emit(
        CitaLoaded(
          citasViewModel,
        ),
      );
    } else {
      emit(Failure(result.left));
    }
  }

  Future<void> eliminarCita(EliminarCitaEvent event, Emitter<CitaIndexState> emit) async {
    emit(Loading());
    final cita = event.citaViewModel;

    final result = await citaRepository.deleteCitaById(event.citaViewModel.id);
    if (result.isRight) {
      emit(CitaIndexState.citaEliminada(cita));
    } else {
      emit(Failure(result.left));
    }
  }
}
