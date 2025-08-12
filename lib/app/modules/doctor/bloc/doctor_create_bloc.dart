import 'package:admin_clinica_front/app/common/models/doctor/doctor_create_model.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_credentials_model.dart';
import 'package:admin_clinica_front/app/common/repository/doctor/i_doctor_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_create_event.dart';
part 'doctor_create_state.dart';
part 'doctor_create_bloc.freezed.dart';

class DoctorCreateBloc extends Bloc<DoctorCreateEvent, DoctorCreateState> {
  final _doctorRepository = locator<IDoctorRepository>();

  DoctorCreateBloc() : super(DoctorCreateState.initial()) {
    on<CreateDoctor>(createDoctor);
  }

  Future<void> createDoctor(CreateDoctor event, Emitter<DoctorCreateState> emit) async {
    final result = await _doctorRepository.createDoctor(event.doctorCreateViewModel);
    if (result.isRight) {
      emit(DoctorCreateState.doctorsLoaded(result.right));
    } else {
      emit(DoctorCreateState.failure(result.left));
    }
  }
}
