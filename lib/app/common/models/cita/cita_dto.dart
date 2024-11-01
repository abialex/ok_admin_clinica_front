// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:admin_clinica_front/app/common/models/paciente/paciente_dto.dart';
import 'package:admin_clinica_front/app/data/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/data/entities/tipo_cita.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_dto.freezed.dart';
part 'cita_dto.g.dart';

@freezed
class CitaDTO with _$CitaDTO {
  const CitaDTO._(); // Constructor privado para usar getters.

  const factory CitaDTO({
    required int id,
    String? doctor,
    String? ubicacion,
    required String fechaHoraCita,
    required int estado,
    required int tipo,
    String? celular,
    PacienteDTO? paciente,
    String? razon,
    String? razonOcupado,
    String? datosPaciente,
    @JsonKey(name: 'doctor_id') int? doctorId,
    int? ubicacion_id, // Manteniendo el guion bajo.
    @JsonKey(name: 'estado_string') required String estadoString, // Manteniendo el guion bajo.
    required String tipo_string, // Manteniendo el guion bajo.
    String? fechaConfirmacion,
    String? fechaValidacion,
    String? fechaInicio,
    String? fechaFin,
  }) = _CitaDTO;

  // Método para deserializar desde JSON.
  factory CitaDTO.fromJson(Map<String, dynamic> json) => _$CitaDTOFromJson(json);

  // Getters personalizados para acceder a los atributos con guion bajo.
  String get tipoString => tipo_string;
  int? get ubicacionId => ubicacion_id;
  DateTime get fechaHoraCitaDate => DateTime.parse(fechaHoraCita);
  DateTime? get fechaConfirmacionDate => DateTime.tryParse(fechaConfirmacion ?? '');
  DateTime? get fechaValidacionDate => DateTime.tryParse(fechaValidacion ?? '');
  DateTime? get fechaInicioDate => DateTime.tryParse(fechaInicio ?? '');
  DateTime? get fechaFinDate => DateTime.tryParse(fechaFin ?? '');

  EstadoCita get estadoEnum => EstadoCitaExtension.fromNumber(estado);
  TipoCita get tipoEnum => TipoCitaExtension.fromNumber(tipo);
}
