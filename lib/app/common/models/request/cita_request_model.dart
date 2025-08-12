// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_request_model.freezed.dart';
part 'cita_request_model.g.dart';

@freezed
class CitaRequestAdmin with _$CitaRequestAdmin {
  const CitaRequestAdmin._(); // Constructor privado para usar getters.

  const factory CitaRequestAdmin({
    @JsonKey(name: 'ubicacion_id') required int ubicacionId,
    @JsonKey(name: 'doctor_id') int? doctorId,
    @JsonKey(name: 'fecha_inicio') String? fechaInicio,
    @JsonKey(name: 'fecha_fin') String? fechaFin,
    @JsonKey(name: 'fecha') String? fecha,
  }) = _CitaRequestAdmin;

  // Método para deserializar desde JSON
  factory CitaRequestAdmin.fromJson(Map<String, dynamic> json) => _$CitaRequestAdminFromJson(json);

  DateTime? get fechaInicioDate => DateTime.tryParse(fechaInicio ?? '');
  DateTime? get fechaFinDate => DateTime.tryParse(fechaFin ?? '');
  DateTime? get fechaDate => DateTime.tryParse(fecha ?? '');
}
