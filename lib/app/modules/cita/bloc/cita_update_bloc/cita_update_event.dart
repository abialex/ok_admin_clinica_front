// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_update_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_update_event.freezed.dart';

@freezed
class CitaUpdateEvent with _$CitaUpdateEvent {
  const CitaUpdateEvent._();
  factory CitaUpdateEvent.citaGetById(int citaId) = CitaGetByIdEvent;
  factory CitaUpdateEvent.citaUpdateLocal(CitaAgilUpdateModel model) = CitaAgilUpdateEvent;
  factory CitaUpdateEvent.citaUpdateError(String error) = CitaUpdateErrorEvent;
}
