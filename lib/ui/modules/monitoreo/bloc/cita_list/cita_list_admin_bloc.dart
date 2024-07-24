import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_list_admin_event.dart';
part 'cita_list_admin_state.dart';
part 'cita_list_admin_bloc.freezed.dart';

class CitaListAdminBloc extends Bloc<CitaListAdminEvent, CitaListAdminState> {
  CitaListAdminBloc() : super(CitaListAdminState.initial()) {
    on<GetCitas>(getCitas);
  }

  final _citaService = locator<CitasService>();

  Future<void> getCitas(GetCitas event, Emitter<CitaListAdminState> emit) async {
    emit(Loading());
    final responseApi = await _citaService.getUbicacionIdDateDoctorId(event.citaRequestViewModel);

    responseApi.fold(
      (left) => emit(
        CitaListAdminState.failure(left),
      ),
      (right) => emit(
        CitaListAdminState.citaLoaded(right),
      ),
    );
  }
}
