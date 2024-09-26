import 'package:admin_clinica_front/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
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
  }
  final _citaService = locator<CitasService>();

  Future<void> getCitas(GetCitas event, Emitter<CitaState> emit) async {
    emit(Loading());
    final responseApi = await _citaService.getCitasByFechaIdDoctorIdUbicacion(event.citaRequestViewModel);

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
}
