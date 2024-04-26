// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaRequest _$CitaRequestFromJson(Map<String, dynamic> json) => CitaRequest(
      fechaHoraCita: json['fechaHoraCita'] as String,
      doctor_id: json['doctor_id'] as int,
      ubicacion_id: json['ubicacion_id'] as int,
    );

Map<String, dynamic> _$CitaRequestToJson(CitaRequest instance) =>
    <String, dynamic>{
      'fechaHoraCita': instance.fechaHoraCita,
      'doctor_id': instance.doctor_id,
      'ubicacion_id': instance.ubicacion_id,
    };
