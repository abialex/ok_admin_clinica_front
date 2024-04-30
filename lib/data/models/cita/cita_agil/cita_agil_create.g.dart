// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_agil_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaAgilCreateModel _$CitaAgilCreateModelFromJson(Map<String, dynamic> json) =>
    CitaAgilCreateModel(
      fechaHoraCita: json['fechaHoraCita'] as String,
      datosPaciente: json['datosPaciente'] as String,
      doctor_id: json['doctor_id'] as int,
      ubicacion_id: json['ubicacion_id'] as int,
    );

Map<String, dynamic> _$CitaAgilCreateModelToJson(
        CitaAgilCreateModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctor_id,
      'ubicacion_id': instance.ubicacion_id,
      'fechaHoraCita': instance.fechaHoraCita,
      'datosPaciente': instance.datosPaciente,
    };
