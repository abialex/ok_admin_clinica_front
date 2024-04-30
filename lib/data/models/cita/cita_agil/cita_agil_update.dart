// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'cita_agil_update.g.dart';

@JsonSerializable()
class CitaAgilUpdateModel {
  final int id;
  final int estado;
  final int doctor_id;
  final int ubicacion_id;
  final String fechaHoraCita;
  final String? celular;
  final String? razon;
  final String datosPaciente;

  CitaAgilUpdateModel({
    required this.id,
    required this.estado,
    required this.doctor_id,
    required this.ubicacion_id,
    required this.fechaHoraCita,
    this.razon,
    this.celular,
    required this.datosPaciente,
  });
  //fromJson
  factory CitaAgilUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$CitaAgilUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaAgilUpdateModelToJson(this);
}
