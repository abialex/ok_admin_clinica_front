import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/request/cita_request_model.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
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

  final citaRepository = locator.get<ICitaRepository>();

  Future<void> getCitas(GetCitas event, Emitter<CitaListAdminState> emit) async {
    emit(Loading());
    final responseApi = await citaRepository.getUbicacionIdDateDoctorId(event.citaRequestViewModel);

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
