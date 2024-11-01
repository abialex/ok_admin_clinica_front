// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_create_event.freezed.dart';

@freezed
class CitaCreateEvent with _$CitaCreateEvent {
  const CitaCreateEvent._();
  factory CitaCreateEvent.citaCreateLocal(CitaAgilCreateModel model) = CitaAgilCreateEvent;
  factory CitaCreateEvent.citaPreCreateLocal(DoctorDto? doctorDatos, DateTime fechaCita, int hora, String horaString) = CitaAgilPreCreateEvent;
  factory CitaCreateEvent.citaCreateError(String error) = CitaCreateErrorEvent;
}
