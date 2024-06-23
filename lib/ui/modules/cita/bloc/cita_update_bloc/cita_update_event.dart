// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_update_event.freezed.dart';

@freezed
class CitaUpdateEvent with _$CitaUpdateEvent {
  const CitaUpdateEvent._();
  factory CitaUpdateEvent.citaGetById(int citaId) = CitaGetByIdEvent;
  factory CitaUpdateEvent.citaUpdateLocal(CitaAgilUpdateViewModel model) = CitaAgilUpdateEvent;
  factory CitaUpdateEvent.citaUpdateError(String error) = CitaUpdateErrorEvent;
}
