// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citas_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitasDTO _$CitasDTOFromJson(Map<String, dynamic> json) => CitasDTO(
      id: json['id'] as int,
      fechaHoraCita: json['fechaHoraCita'] as String,
      estado: json['estado'] as int,
      tipo: json['tipo'] as int,
      celular: json['celular'] as String?,
      paciente: json['paciente'] == null
          ? null
          : PacienteDTO.fromJson(json['paciente'] as Map<String, dynamic>),
      razon: json['razon'] as String?,
      razonOcupado: json['razonOcupado'] as String?,
      datosPaciente: json['datosPaciente'] as String?,
      estado_string: json['estado_string'] as String?,
      tipo_string: json['tipo_string'] as String?,
      fechaConfirmacion: json['fechaConfirmacion'] as String?,
      fechaValidacion: json['fechaValidacion'] as String?,
      fechaInicio: json['fechaInicio'] as String?,
      fechaFin: json['fechaFin'] as String?,
    );

Map<String, dynamic> _$CitasDTOToJson(CitasDTO instance) => <String, dynamic>{
      'id': instance.id,
      'fechaHoraCita': instance.fechaHoraCita,
      'estado': instance.estado,
      'tipo': instance.tipo,
      'celular': instance.celular,
      'paciente': instance.paciente,
      'razon': instance.razon,
      'razonOcupado': instance.razonOcupado,
      'datosPaciente': instance.datosPaciente,
      'estado_string': instance.estado_string,
      'tipo_string': instance.tipo_string,
      'fechaConfirmacion': instance.fechaConfirmacion,
      'fechaValidacion': instance.fechaValidacion,
      'fechaInicio': instance.fechaInicio,
      'fechaFin': instance.fechaFin,
    };
