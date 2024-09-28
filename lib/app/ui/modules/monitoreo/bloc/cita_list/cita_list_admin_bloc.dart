import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/mappers/citas_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_list_admin_event.dart';
part 'cita_list_admin_state.dart';
part 'cita_list_admin_bloc.freezed.dart';

class CitaListAdminBloc extends Bloc<CitaListAdminEvent, CitaListAdminState> {
  CitaListAdminBloc() : super(CitaListAdminState.initial()) {
    on<GetCitas>(getCitas);
    on<InitialCitaListAdmin>(initialCitas);
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

  Future<void> initialCitas(InitialCitaListAdmin event, Emitter<CitaListAdminState> emit) async {
    emit(Initial());
  }
}
