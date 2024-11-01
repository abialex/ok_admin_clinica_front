import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/repository/doctor/i_doctor_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/enums/doctor_accion_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_index_event.dart';
part 'doctor_index_state.dart';
part 'doctor_index_bloc.freezed.dart';

class DoctorIndexBloc extends Bloc<DoctorIndexEvent, DoctorIndexState> {
  DoctorIndexBloc() : super(DoctorIndexState.initial()) {
    on<InitialEvent>(initial);
    on<NextCitaEvent>(doctorAction);
    on<GetDoctorEvent>(getDoctorById);
    on<ResetPasswordEvent>(resetPassword);
  }

  final _doctorRepository = locator<IDoctorRepository>();

  Future<void> initial(InitialEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    emit(DoctorIndexState.doctorLoaded(event.doctorsViewModel));
  }

  Future<void> doctorAction(NextCitaEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final doctor = event.doctorsViewModel;

    switch (event.doctorAction) {
      case DoctorActionEnum.activar:
        final result = await _doctorRepository.activarDoctor(doctor.id);
        if (result.isRight) {
          add(DoctorIndexEvent.getDoctor(doctor.id));
        } else {
          emit(FailureState(result.left));
        }
      case DoctorActionEnum.inactivar:
        final result = await _doctorRepository.inactivarDoctor(doctor.id);
        if (result.isRight) {
          add(DoctorIndexEvent.getDoctor(doctor.id));
        } else {
          emit(FailureState(result.left));
        }
    }
  }

  Future<void> resetPassword(ResetPasswordEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final doctor = event.doctorsViewModel;

    final result = await _doctorRepository.resetPassword(doctor.id);
    if (result.isRight) {
      emit(SuccessState(result.right));
    } else {
      emit(FailureState(result.left));
    }
  }

  Future<void> getDoctorById(GetDoctorEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final result = await _doctorRepository.getDoctorById(event.doctorId);
    if (result.isRight) {
      final doctorViewModel = result.right;
      emit(
        DoctorLoadedState(
          doctorViewModel,
        ),
      );
    } else {
      emit(FailureState(result.left));
    }
  }
}
