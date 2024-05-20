import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../dominio/services/doctor_service.dart';

part 'cita_event.dart';
part 'cita_state.dart';
part 'cita_bloc.freezed.dart';

class CitaBloc extends Bloc<CitaEvent, CitaState> {
  CitaBloc() : super(CitaState.initial()) {
    on<CitaEvent>((event, emit) {});
    on<GetCitas>(getCitas);
  }
  final _citaService = locator<CitasService>();
  final _doctorService = locator<DoctorService>();

  Future<void> getCitas(GetCitas event, Emitter<CitaState> emit) async {
    emit(Loading());
    await Future.delayed(const Duration(milliseconds: 200));
    final responseApi = await _citaService.getCitasByFechaIdDoctorIdUbicacion(CitaRequestViewModel(
      doctorId: 1,
      ubicacionId: 2,
      fechaHoraCita: DateTime(2024, 02, 03),
    ));

    responseApi.fold(
      (left) => emit(
        CitaState.failure(left),
      ),
      (right) => emit(
        CitaState.citaLoaded(right),
      ),
    );
  }
}
