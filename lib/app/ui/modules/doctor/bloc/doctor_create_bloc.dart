import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_create_event.dart';
part 'doctor_create_state.dart';
part 'doctor_create_bloc.freezed.dart';

class DoctorCreateBloc extends Bloc<DoctorCreateEvent, DoctorCreateState> {
  final DoctorService _doctorService = locator<DoctorService>();

  DoctorCreateBloc() : super(DoctorCreateState.initial()) {
    on<CreateDoctor>(createDoctor);
  }

  Future<void> createDoctor(CreateDoctor event, Emitter<DoctorCreateState> emit) async {
    final result = await _doctorService.createDoctor(event.doctorCreateViewModel);
    if (result.isRight) {
      emit(DoctorCreateState.doctorsLoaded(result.right));
    } else {
      emit(DoctorCreateState.failure(result.left));
    }
  }
}
