import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/repository/doctor/i_doctor_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';
part 'doctor_list_bloc.freezed.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final _localService = locator<ILocalRepository>();
  final _doctorRepository = locator<IDoctorRepository>();

  DoctorListBloc() : super(DoctorListState.initial()) {
    on<GetDoctors>(getDoctors);
  }

  Future<void> getDoctors(GetDoctors event, Emitter<DoctorListState> emit) async {
    emit(DoctorListState.loading());
    final usuario = await _localService.getUsuario();
    late Either<String, List<DoctorDto>> result;
    switch (usuario!.rol) {
      case "ASISTENTE":
        result = await _doctorRepository.getDoctorsByIdUbicacionFromAsistente();
        break;
      case "ADMINISTRADOR":
        result = await _doctorRepository.getDoctors();
        break;
      case "DOCTOR":
        if (usuario.tipo == "Administrador") {
          result = await _doctorRepository.getDoctors();
          break;
        }
        result = await _doctorRepository.getDoctorByUserDoctor();
        break;
      default:
        emit(DoctorListState.failure("No se ha detecto rol definido"));
        return;
      // result = await _doctorService.getDoctorsByIdUbicacionFromAsistente();
    }
    result.fold((left) => emit(DoctorListState.failure(left)), (right) => emit(DoctorListState.doctorsLoaded(right)));
  }
}
