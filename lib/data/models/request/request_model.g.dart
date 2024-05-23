// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaRequest _$CitaRequestFromJson(Map<String, dynamic> json) => CitaRequest(
      fechaHoraCita: json['fechaHoraCita'] as String,
      doctor_id: json['doctor_id'] as int,
      ubicaciones_id: (json['ubicaciones_id'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$CitaRequestToJson(CitaRequest instance) =>
    <String, dynamic>{
      'fechaHoraCita': instance.fechaHoraCita,
      'doctor_id': instance.doctor_id,
      'ubicaciones_id': instance.ubicaciones_id,
    };
