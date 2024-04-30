// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCreateModel _$DoctorCreateModelFromJson(Map<String, dynamic> json) =>
    DoctorCreateModel(
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      celular: json['celular'] as String,
      fechaNacimiento: json['fechaNacimiento'] as String,
      ubicaciones_id: (json['ubicaciones_id'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$DoctorCreateModelToJson(DoctorCreateModel instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'fechaNacimiento': instance.fechaNacimiento,
      'ubicaciones_id': instance.ubicaciones_id,
    };
