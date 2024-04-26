// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/cita.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cita_agil_update.g.dart';

@JsonSerializable()
class CitaAgilUpdateModel extends Cita {
  final int ubicacion_id;
  final int doctor_id;

  CitaAgilUpdateModel({
    required super.id,
    required super.estado,
    required this.doctor_id,
    required this.ubicacion_id,
    required super.fechaHoraCita,
    required super.razon,
    required super.datosPaciente,
  }) : super(
          doctorId: doctor_id,
          ubicacionId: ubicacion_id,
        );
  //fromJson
  factory CitaAgilUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$CitaAgilUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaAgilUpdateModelToJson(this);
}
