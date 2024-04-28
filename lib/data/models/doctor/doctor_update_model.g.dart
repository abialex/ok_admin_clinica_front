// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorUpdateModel _$DoctorUpdateModelFromJson(Map<String, dynamic> json) =>
    DoctorUpdateModel(
      id: json['id'] as int?,
      dni: json['dni'] as String?,
      nombres: json['nombres'] as String?,
      apellidos: json['apellidos'] as String?,
      celular: json['celular'] as String?,
      fechaNacimiento:
          const DateTimeConverter().fromJson(json['fechaNacimiento'] as String),
      ubicaciones_id: (json['ubicaciones_id'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$DoctorUpdateModelToJson(DoctorUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'ubicaciones_id': instance.ubicaciones_id,
      'fechaNacimiento':
          const DateTimeConverter().toJson(instance.fechaNacimiento),
    };
