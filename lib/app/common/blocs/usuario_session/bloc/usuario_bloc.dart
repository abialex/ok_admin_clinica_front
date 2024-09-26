import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/app_dependecy_injection.dart';
import '../../../../dominio/services/local_service.dart';
import '../../../../ui/view_models/usuario_view/usuario_view_models.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';
part 'usuario_bloc.freezed.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final _localService = locator<LocalService>();

  UsuarioBloc() : super(const _Initial()) {
    on<SetupUsuarioEvent>((event, emit) {
      emit(state.copyWith(usuario: event.usuario));
    });
    on<SetUsuarioEvent>((event, emit) {
      emit(state.copyWith(usuario: event.usuario));
    });
    on<SetDoctorSelectedEvent>((event, emit) {
      emit(state.copyWith(doctorIdSelected: event.doctorIdSelected));
    });
    on<SetupDoctorSelectedEvent>((event, emit) {
      emit(state.copyWith(doctorIdSelected: event.doctorIdSelected));
    });

    getUsuario();
    getDoctorSelected();
  }
  getUsuario() async {
    final result = await _localService.getUsuario();
    add(SetupUsuarioEvent(result));
  }

  setUsuario(UsuarioLoginResponseViewModel usuario) async {
    await _localService.saveUsuario(usuario);
    await _localService.saveToken(usuario.token);
    add(SetUsuarioEvent(usuario));
  }

  setDoctorSelected(DoctorsViewModel doctorId) async {
    await _localService.saveDoctorSelected(doctorId);
    add(SetDoctorSelectedEvent(doctorId));
  }

  getDoctorSelected() async {
    final result = await _localService.getIdDoctorSelected();
    add(SetupDoctorSelectedEvent(result));
  }
}
