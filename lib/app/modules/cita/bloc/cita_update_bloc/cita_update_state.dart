// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_update_state.freezed.dart';

@freezed
class CitaUpdateState with _$CitaUpdateState {
  const CitaUpdateState._();
  factory CitaUpdateState.initial() = CitaUpdateInitialState;
  factory CitaUpdateState.loading() = CitaUpdateLoadingState;
  factory CitaUpdateState.citaAgilSetup(CitaDTO citaViewModel) = CitaAgilSetupState;
  factory CitaUpdateState.citaUpdateSuccess(int id, int doctorId, List<int> ubicacionesId, DateTime fechaCita) = CitaUpdateSuccessState;
  factory CitaUpdateState.failure(String error) = CitaUpdateErrorState;
}
