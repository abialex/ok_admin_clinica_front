import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/doctor_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
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

  final doctorService = locator<DoctorService>();

  Future<void> initial(InitialEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    emit(DoctorIndexState.doctorLoaded(event.doctorsViewModel));
  }

  Future<void> doctorAction(NextCitaEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final doctor = event.doctorsViewModel;

    final result = await doctorService.doctorAction(event.doctorAction, doctor.id);
    if (result.isRight) {
      add(DoctorIndexEvent.getDoctor(doctor.id));
    } else {
      emit(FailureState(result.left));
    }
  }

  Future<void> resetPassword(ResetPasswordEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final doctor = event.doctorsViewModel;

    final result = await doctorService.resetPassword(doctor.id);
    if (result.isRight) {
      emit(SuccessState(result.right));
    } else {
      emit(FailureState(result.left));
    }
  }

  Future<void> getDoctorById(GetDoctorEvent event, Emitter<DoctorIndexState> emit) async {
    emit(LoadingState());
    final result = await doctorService.getDoctorById(event.doctorId);
    if (result.isRight) {
      final doctorViewModel = result.right;
      emit(
        DoctorLoadedState(
          DoctorsViewModel(
            id: doctorViewModel.id,
            apellidos: doctorViewModel.apellidos,
            fechaNacimiento: doctorViewModel.fechaNacimiento,
            isActive: doctorViewModel.isActive,
            usuarioId: doctorViewModel.usuarioId,
            username: doctorViewModel.username,
            nombres: doctorViewModel.nombres,
            celular: doctorViewModel.celular,
          ),
        ),
      );
    } else {
      emit(FailureState(result.left));
    }
  }
}
