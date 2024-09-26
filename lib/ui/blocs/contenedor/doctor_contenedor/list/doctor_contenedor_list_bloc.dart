import 'package:admin_clinica_front/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/data/models/filter_model/filter_model.dart';
import 'package:admin_clinica_front/dominio/repositories/idoctor_contenedor/idoctor_contenedor_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_contenedor_list_event.dart';
part 'doctor_contenedor_list_state.dart';
part 'doctor_contenedor_list_bloc.freezed.dart';

class DoctorContenedorListBloc extends Bloc<DoctorContenedorListEvent, DoctorContenedorListState> {
  final doctorContenedorRepository = locator.get<IDoctorContenedorLocalRepository>();
  DoctorContenedorListBloc() : super(DoctorContenedorListState.initial()) {
    on<DoctorContenedorGetAPIEvent>(getContenedors);
  }

  Future<void> getContenedors(DoctorContenedorGetAPIEvent event, Emitter<DoctorContenedorListState> emit) async {
    // Add your implementation here
    emit(DoctorContenedorListLoadingState());
    final result = await doctorContenedorRepository.getLocalDoctorContenedorByFilter(event.filter);
    if (result.isRight) {
      emit(DoctorContenedorListLoadedState(result.right));
    } else {
      emit(DoctorContenedorListErrorState(result.left));
    }
  }
}
