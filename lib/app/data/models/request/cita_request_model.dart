// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'cita_request_model.g.dart';

@JsonSerializable()
class CitaRequestAdmin {
  final int ubicacion_id;
  final int? doctor_id;
  final String? fecha_inicio;
  final String? fecha_fin;
  final String? fecha;

  CitaRequestAdmin({
    required this.ubicacion_id,
    this.doctor_id,
    this.fecha_inicio,
    this.fecha_fin,
    this.fecha,
  });
  //fromJson
  factory CitaRequestAdmin.fromJson(Map<String, dynamic> map) => _$CitaRequestAdminFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaRequestAdminToJson(this);
}
