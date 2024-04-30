// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaDTO _$CitaDTOFromJson(Map<String, dynamic> json) => CitaDTO(
      id: json['id'] as int,
      doctor: json['doctor'] as String,
      ubicacion: json['ubicacion'] as String,
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
      doctor_id: json['doctor_id'] as int,
      ubicacion_id: json['ubicacion_id'] as int,
      estado_string: json['estado_string'] as String?,
      tipo_string: json['tipo_string'] as String?,
      fechaConfirmacion: json['fechaConfirmacion'] as String?,
      fechaValidacion: json['fechaValidacion'] as String?,
      fechaInicio: json['fechaInicio'] as String?,
      fechaFin: json['fechaFin'] as String?,
    );

Map<String, dynamic> _$CitaDTOToJson(CitaDTO instance) => <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'ubicacion': instance.ubicacion,
      'fechaHoraCita': instance.fechaHoraCita,
      'estado': instance.estado,
      'tipo': instance.tipo,
      'celular': instance.celular,
      'paciente': instance.paciente,
      'razon': instance.razon,
      'razonOcupado': instance.razonOcupado,
      'datosPaciente': instance.datosPaciente,
      'doctor_id': instance.doctor_id,
      'ubicacion_id': instance.ubicacion_id,
      'estado_string': instance.estado_string,
      'tipo_string': instance.tipo_string,
      'fechaConfirmacion': instance.fechaConfirmacion,
      'fechaValidacion': instance.fechaValidacion,
      'fechaInicio': instance.fechaInicio,
      'fechaFin': instance.fechaFin,
    };
