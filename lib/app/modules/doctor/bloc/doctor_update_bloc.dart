import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_update_model.dart';
import 'package:admin_clinica_front/app/common/repository/doctor/i_doctor_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_update_event.dart';
part 'doctor_update_state.dart';
part 'doctor_update_bloc.freezed.dart';

class DoctorUpdateBloc extends Bloc<DoctorUpdateEvent, DoctorUpdateState> {
  DoctorUpdateBloc() : super(DoctorUpdateState.initial()) {
    on<GetDoctor>(getDoctor);
    on<DoctorUpdatedEvent>(updateDoctor);
  }

  final _doctorRepository = locator<IDoctorRepository>();

  Future<void> getDoctor(GetDoctor event, Emitter<DoctorUpdateState> emit) async {
    emit(DoctorUpdateState.loading());
    final result = await _doctorRepository.getDoctorById(event.id);
    if (result.isRight) {
      emit(DoctorUpdateState.doctorSetup(result.right));
    } else {
      emit(DoctorUpdateState.failure(result.left));
    }
  }

  Future<void> updateDoctor(DoctorUpdatedEvent event, Emitter<DoctorUpdateState> emit) async {
    emit(DoctorUpdateState.loading());
    final result = await _doctorRepository.updateDoctor(event.doctorUpdateView);
    if (result.isRight) {
      emit(DoctorUpdateState.doctorUpdated(result.right));
    } else {
      emit(DoctorUpdateState.failure(result.left));
    }
  }
}
