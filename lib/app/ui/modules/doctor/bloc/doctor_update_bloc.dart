import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
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

  final _doctorService = locator<DoctorService>();

  Future<void> getDoctor(GetDoctor event, Emitter<DoctorUpdateState> emit) async {
    emit(DoctorUpdateState.loading());
    final result = await _doctorService.getDoctorById(event.id);
    if (result.isRight) {
      emit(DoctorUpdateState.doctorSetup(result.right));
    } else {
      emit(DoctorUpdateState.failure(result.left));
    }
  }

  Future<void> updateDoctor(DoctorUpdatedEvent event, Emitter<DoctorUpdateState> emit) async {
    emit(DoctorUpdateState.loading());
    final result = await _doctorService.updateDoctor(event.doctorUpdateView);
    if (result.isRight) {
      emit(DoctorUpdateState.doctorUpdated(result.right));
    } else {
      emit(DoctorUpdateState.failure(result.left));
    }
  }
}
