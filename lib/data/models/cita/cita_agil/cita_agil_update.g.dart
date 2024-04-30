// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_agil_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaAgilUpdateModel _$CitaAgilUpdateModelFromJson(Map<String, dynamic> json) =>
    CitaAgilUpdateModel(
      id: json['id'] as int,
      estado: json['estado'] as int,
      doctor_id: json['doctor_id'] as int,
      ubicacion_id: json['ubicacion_id'] as int,
      fechaHoraCita: json['fechaHoraCita'] as String,
      razon: json['razon'] as String?,
      datosPaciente: json['datosPaciente'] as String,
    );

Map<String, dynamic> _$CitaAgilUpdateModelToJson(
        CitaAgilUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estado': instance.estado,
      'doctor_id': instance.doctor_id,
      'ubicacion_id': instance.ubicacion_id,
      'fechaHoraCita': instance.fechaHoraCita,
      'razon': instance.razon,
      'datosPaciente': instance.datosPaciente,
    };
