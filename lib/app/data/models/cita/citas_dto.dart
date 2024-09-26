// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/app/data/models/paciente/paciente_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'citas_dto.g.dart';

@JsonSerializable()
class CitasDTO {
  final int id;
  final String fechaHoraCita;
  final int estado;
  final int tipo;
  final String? celular;
  final PacienteDTO? paciente;
  final String? razon;
  final String? razonOcupado;
  final String? datosPaciente;
  final String estado_string;
  final String tipo_string;
  final String? fechaConfirmacion;
  final String? fechaValidacion;
  final String? fechaInicio;
  final String? fechaFin;
  final String? ubicacion;
  final int? ubicacion_id;

  CitasDTO({
    required this.id,
    required this.fechaHoraCita,
    required this.estado,
    required this.tipo,
    this.celular,
    this.paciente,
    this.razon,
    this.razonOcupado,
    this.datosPaciente,
    required this.estado_string,
    required this.tipo_string,
    this.fechaConfirmacion,
    this.fechaValidacion,
    this.fechaInicio,
    this.fechaFin,
    this.ubicacion,
    this.ubicacion_id,
  });
  //fromJson
  factory CitasDTO.fromJson(Map<String, dynamic> map) => _$CitasDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitasDTOToJson(this);
}
