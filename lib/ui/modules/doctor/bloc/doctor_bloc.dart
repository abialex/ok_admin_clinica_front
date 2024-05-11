import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/dominio/services/ubicacion_service.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/ubicacion_view/ubicacion_view.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../dominio/services/local_service.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';
part 'doctor_bloc.freezed.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService _doctorService = locator<DoctorService>();
  final LocalService _localService = locator<LocalService>();

  DoctorBloc() : super(DoctorState.initial()) {
    on<GetDoctors>(getDoctors);
  }

  Future<void> getDoctors(GetDoctors event, Emitter<DoctorState> emit) async {
    final usuario = await _localService.getUsuario();

    final result = await _doctorService.getDoctorsByIdUbicacionFromAsistente();
    result.fold((left) => emit(DoctorState.failure(left)), (right) => emit(DoctorState.doctorsLoaded(right)));
  }

  Future<void> createDoctor() async {
    final result = await _doctorService.createDoctor(
      DoctorCreateViewModel(
        dni: "57482910",
        nombres: "test front",
        apellidos: "apellido front",
        celular: "celular",
        fechaNacimiento: DateTime.now(),
        ubicacionesId: [1, 2],
      ),
    );
    if (result.isRight) {
    } else {
      print("log ${result.left}");
    }
  }

  Future<void> updateDoctor() async {
    final result = await _doctorService.updateDoctor(
      DoctorUpdateViewModel(
        id: 5,
        dni: "57400910",
        nombres: "test front",
        apellidos: "apellido front",
        celular: "celular",
        fechaNacimiento: DateTime.now(),
        ubicacionesId: [1, 2],
      ),
    );
    if (result.isRight) {
    } else {
      print("log ${result.left}");
    }
  }
}
