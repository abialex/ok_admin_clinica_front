// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/paciente.dart';
import 'package:json_annotation/json_annotation.dart';
part 'paciente_dto.g.dart';

@JsonSerializable()
class PacienteDTO extends Paciente {
  final int usuario_id;
  final String usuario_username;
  final dynamic historiaL_medico;

  PacienteDTO({
    required int super.id,
    required String super.dni,
    required String super.nombres,
    required String super.apellidos,
    required String super.celular,
    required super.domicilio,
    required this.usuario_id,
    required this.usuario_username,
    required super.fechaNacimiento,
    required this.historiaL_medico,
  }) : super(
          usuarioId: usuario_id,
          usuarioUsername: usuario_username,
          historialMedico: historiaL_medico,
        );

  //fromJson
  factory PacienteDTO.fromJson(Map<String, dynamic> map) =>
      _$PacienteDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteDTOToJson(this);
}
