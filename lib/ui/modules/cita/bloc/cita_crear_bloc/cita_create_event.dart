// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_create_event.freezed.dart';

@freezed
class CitaCreateEvent with _$CitaCreateEvent {
  const CitaCreateEvent._();
  factory CitaCreateEvent.citaCreateLocal(CitaAgilCreateViewModel model) = CitaAgilCreateEvent;
  factory CitaCreateEvent.citaPreCreateLocal(DoctorsViewModel? doctorDatos, DateTime fechaCita, int hora, String horaString) = CitaAgilPreCreateEvent;
  factory CitaCreateEvent.citaCreateError(String error) = CitaCreateErrorEvent;
}
