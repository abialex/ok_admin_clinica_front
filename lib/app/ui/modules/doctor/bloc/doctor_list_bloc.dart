import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/app/dominio/services/local_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';
part 'doctor_list_bloc.freezed.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final DoctorService _doctorService = locator<DoctorService>();
  final LocalService _localService = locator<LocalService>();

  DoctorListBloc() : super(DoctorListState.initial()) {
    on<GetDoctors>(getDoctors);
  }

  Future<void> getDoctors(GetDoctors event, Emitter<DoctorListState> emit) async {
    emit(DoctorListState.loading());
    final usuario = await _localService.getUsuario();
    late Either<String, List<DoctorsViewModel>> result;
    switch (usuario!.rol) {
      case "ASISTENTE":
        result = await _doctorService.getDoctorsByIdUbicacionFromAsistente();
        break;
      case "ADMINISTRADOR":
        result = await _doctorService.getDoctors();
        break;
      case "DOCTOR":
        if (usuario.tipo == "Administrador") {
          result = await _doctorService.getDoctors();
          break;
        }
        result = await _doctorService.getDoctorByUserDoctor();
        break;
      default:
        emit(DoctorListState.failure("No se ha detecto rol definido"));
        return;
      // result = await _doctorService.getDoctorsByIdUbicacionFromAsistente();
    }
    result.fold((left) => emit(DoctorListState.failure(left)), (right) => emit(DoctorListState.doctorsLoaded(right)));
  }
}
