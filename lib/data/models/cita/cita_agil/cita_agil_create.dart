// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'cita_agil_create.g.dart';

@JsonSerializable()
class CitaAgilCreateModel {
  final int doctor_id;
  final int ubicacion_id;
  final String fechaHoraCita;
  final String datosPaciente;
  final String? celular;
  final String? razon;

  CitaAgilCreateModel({
    required this.fechaHoraCita,
    required this.datosPaciente,
    required this.doctor_id,
    required this.ubicacion_id,
    this.celular,
    this.razon,
  });
  //fromJson
  factory CitaAgilCreateModel.fromJson(Map<String, dynamic> map) =>
      _$CitaAgilCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaAgilCreateModelToJson(this);
}
