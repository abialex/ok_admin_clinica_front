// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_create_state.freezed.dart';

@freezed
class CitaCreateState with _$CitaCreateState {
  const CitaCreateState._();
  factory CitaCreateState.initial() = CitaCreateInitialState;
  factory CitaCreateState.loading() = CitaCreateLoadingState;
  factory CitaCreateState.citaUploadPreDatos(DoctorsViewModel? doctorDatos, DateTime fechaCita, int hora, String horaString) = CitaUploadPreDatosState;
  factory CitaCreateState.citaCreateSuccess(int id, int doctorId, List<int> ubicacionesId, DateTime fechaCita) = CitaCreateSuccessState;
  factory CitaCreateState.failure(String error) = CitaCreateErrorState;
}
