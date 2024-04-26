// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteDTO _$PacienteDTOFromJson(Map<String, dynamic> json) => PacienteDTO(
      id: json['id'] as int,
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      celular: json['celular'] as String,
      domicilio: json['domicilio'] as String?,
      usuario_id: json['usuario_id'] as int,
      usuario_username: json['usuario_username'] as String,
      fechaNacimiento: json['fechaNacimiento'] == null
          ? null
          : DateTime.parse(json['fechaNacimiento'] as String),
      historiaL_medico: json['historiaL_medico'],
    );

Map<String, dynamic> _$PacienteDTOToJson(PacienteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'domicilio': instance.domicilio,
      'fechaNacimiento': instance.fechaNacimiento?.toIso8601String(),
      'usuario_id': instance.usuario_id,
      'usuario_username': instance.usuario_username,
      'historiaL_medico': instance.historiaL_medico,
    };
