import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cita_event.dart';
part 'cita_state.dart';
part 'cita_bloc.freezed.dart';

class CitaBloc extends Bloc<CitaEvent, CitaState> {
  CitaBloc() : super(CitaState.initial()) {
    on<CitaEvent>((event, emit) {});
    on<GetCitas>(getCitas);
    on<InvalidCitaEvent>(invalidCitas);
    on<BlockCitasEvent>(blockCita);
    on<FreeCitasEvent>(freeCita);
  }
  final citaRepository = locator<ICitaRepository>();

  Future<void> getCitas(GetCitas event, Emitter<CitaState> emit) async {
    emit(CitaLoading());
    final responseApi = await citaRepository.getCitasByFechaIdDoctorIdUbicacion(event.citaRequestViewModel);

    responseApi.fold(
      (left) => emit(
        CitaState.failure(left),
      ),
      (right) => emit(
        CitaState.citaLoaded(right),
      ),
    );
  }

  Future<void> invalidCitas(InvalidCitaEvent event, Emitter<CitaState> emit) async {
    emit(Failure(event.message));
  }

  Future<void> blockCita(BlockCitasEvent event, Emitter<CitaState> emit) async {
    emit(CitaLoading());
    final result = await citaRepository.createCitaOcupada(event.citaRequestViewModel);
    if (result.isRight) {
      emit(CitaState.citaOcupadaCreated());
    } else {
      result.left;
      emit(CitaState.failure(result.left));
    }
  }

  Future<void> freeCita(FreeCitasEvent event, Emitter<CitaState> emit) async {
    emit(CitaLoading());
    final result = await citaRepository.deleteCitaById(event.citaId);
    if (result.isRight) {
      emit(CitaState.citaOcupadaCreated());
    } else {
      result.left;
      emit(CitaState.failure(result.left));
    }
  }
}
