// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/data/models/paciente/paciente_dto.dart';
import 'package:admin_clinica_front/dominio/entities/cita.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cita_dto.g.dart';

@JsonSerializable()
class CitaDTO {
  final int id;
  final String doctor;
  final String ubicacion;
  final String fechaHoraCita;
  final int estado;
  final int tipo;
  final String? celular;
  final PacienteDTO? paciente;
  final String? razon;
  final String? razonOcupado;
  final String? datosPaciente;
  final int doctor_id;
  final int ubicacion_id;
  final String? estado_string;
  final String? tipo_string;
  final String? fechaConfirmacion;
  final String? fechaValidacion;
  final String? fechaInicio;
  final String? fechaFin;

  CitaDTO({
    required this.id,
    required this.doctor,
    required this.ubicacion,
    required this.fechaHoraCita,
    required this.estado,
    required this.tipo,
    required this.celular,
    this.paciente,
    this.razon,
    this.razonOcupado,
    this.datosPaciente,
    required this.doctor_id,
    required this.ubicacion_id,
    this.estado_string,
    this.tipo_string,
    this.fechaConfirmacion,
    this.fechaValidacion,
    this.fechaInicio,
    this.fechaFin,
  });

  //fromJson
  factory CitaDTO.fromJson(Map<String, dynamic> map) => _$CitaDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaDTOToJson(this);
}
