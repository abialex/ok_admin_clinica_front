// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/data/models/paciente/paciente_dto.dart';
import 'package:admin_clinica_front/dominio/entities/cita.dart';
import 'package:json_annotation/json_annotation.dart';
part 'citas_dto.g.dart';

@JsonSerializable()
class CitasDTO extends Cita {
  // final int doctor_id;
  // final int ubicacion_id;
  final String? estado_string;
  final String? tipo_string;

  CitasDTO({
    required int super.id,
    // required String super.doctor,
    // required String super.ubicacion,
    required String super.fechaHoraCita,
    required int super.estado,
    required int super.tipo,
    required super.celular,
    PacienteDTO? super.paciente,
    super.razon,
    super.razonOcupado,
    super.datosPaciente,
    // required this.doctor_id,
    // required this.ubicacion_id,
    String? fechaConfirmacion,
    String? fechaValidacion,
    String? fechaInicio,
    String? fechaFin,
    required this.estado_string,
    required this.tipo_string,
  }) : super(
          // doctorId: doctor_id,
          // ubicacionId: ubicacion_id,
          estadoString: estado_string,
          tipoString: tipo_string,
          fechaConfirmacion: fechaConfirmacion != null
              ? DateTime.parse(fechaConfirmacion)
              : null,
          fechaValidacion:
              fechaValidacion != null ? DateTime.parse(fechaValidacion) : null,
          fechaInicio: fechaInicio != null ? DateTime.parse(fechaInicio) : null,
          fechaFin: fechaFin != null ? DateTime.parse(fechaFin) : null,
        );

  //fromJson
  factory CitasDTO.fromJson(Map<String, dynamic> map) =>
      _$CitasDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitasDTOToJson(this);
}
