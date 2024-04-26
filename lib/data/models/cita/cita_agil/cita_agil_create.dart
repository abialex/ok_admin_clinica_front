// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/cita.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cita_agil_create.g.dart';

@JsonSerializable()
class CitaAgilCreateModel extends Cita {
  final int doctor_id;
  final int ubicacion_id;

  CitaAgilCreateModel({
    required super.fechaHoraCita,
    required super.datosPaciente,
    required this.doctor_id,
    required this.ubicacion_id,
  }) : super(
          doctorId: doctor_id,
          ubicacionId: ubicacion_id,
        );
  //fromJson
  factory CitaAgilCreateModel.fromJson(Map<String, dynamic> map) =>
      _$CitaAgilCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaAgilCreateModelToJson(this);
}
