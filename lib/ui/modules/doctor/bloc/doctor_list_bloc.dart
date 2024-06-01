import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/dominio/services/local_service.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
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
      default:
        emit(DoctorListState.failure("No se ha detecto rol definido"));
      // result = await _doctorService.getDoctorsByIdUbicacionFromAsistente();
    }
    result.fold((left) => emit(DoctorListState.failure(left)), (right) => emit(DoctorListState.doctorsLoaded(right)));
  }
}
