// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDto _$DoctorDtoFromJson(Map<String, dynamic> json) => DoctorDto(
      id: json['id'] as int?,
      usuario_id: json['usuario_id'] as int,
      usuario_username: json['usuario_username'] as String,
      ubicaciones: (json['ubicaciones'] as List<dynamic>)
          .map((e) => UbicacionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      dni: json['dni'] as String?,
      nombres: json['nombres'] as String?,
      apellidos: json['apellidos'] as String?,
      celular: json['celular'] as String?,
      domicilio: json['domicilio'] as String?,
      fechaNacimiento: json['fechaNacimiento'] == null
          ? null
          : DateTime.parse(json['fechaNacimiento'] as String),
      especialidad: json['especialidad'],
    );

Map<String, dynamic> _$DoctorDtoToJson(DoctorDto instance) => <String, dynamic>{
      'id': instance.id,
      'ubicaciones': instance.ubicaciones,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'domicilio': instance.domicilio,
      'fechaNacimiento': instance.fechaNacimiento?.toIso8601String(),
      'especialidad': instance.especialidad,
      'usuario_id': instance.usuario_id,
      'usuario_username': instance.usuario_username,
    };
