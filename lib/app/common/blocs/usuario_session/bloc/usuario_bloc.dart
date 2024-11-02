import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/app_dependecy_injection.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';
part 'usuario_bloc.freezed.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final _localRepository = locator.get<ILocalRepository>();

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
    final result = await _localRepository.getUsuario();
    add(SetupUsuarioEvent(result));
  }

  setUsuario(UserResponseDataModel usuario) async {
    await _localRepository.saveUsuario(usuario);
    await _localRepository.saveToken(usuario.token);
    add(SetUsuarioEvent(usuario));
  }

  setDoctorSelected(DoctorDto doctorId) async {
    _localRepository.saveDoctorSelected(doctorId);
    await _localRepository.saveDoctorSelected(doctorId);
    add(SetDoctorSelectedEvent(doctorId));
  }

  getDoctorSelected() async {
    final result = await _localRepository.getDoctorSelected();
    add(SetupDoctorSelectedEvent(result));
  }
}
