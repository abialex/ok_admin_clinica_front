// // ignore_for_file: non_constant_identifier_names

// import 'package:admin_clinica_front/app/common/models/paciente/paciente_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'citas_dto.freezed.dart';
// part 'citas_dto.g.dart';

// @freezed
// class CitasDTO with _$CitasDTO {
//   const CitasDTO._(); // Constructor privado para utilizar getters

//   const factory CitasDTO({
//     required int id,
//     required String fechaHoraCita,
//     required int estado,
//     required int tipo,
//     String? celular,
//     PacienteDTO? paciente,
//     String? razon,
//     String? razonOcupado,
//     String? datosPaciente,
//     required String estado_string, // Manteniendo el guion bajo
//     required String tipo_string, // Manteniendo el guion bajo
//     String? fechaConfirmacion,
//     String? fechaValidacion,
//     String? fechaInicio,
//     String? fechaFin,
//     String? ubicacion,
//     int? ubicacion_id, // Manteniendo el guion bajo
//   }) = _CitasDTO;

//   // Método para deserializar desde JSON
//   factory CitasDTO.fromJson(Map<String, dynamic> json) => _$CitasDTOFromJson(json);

//   // Getters para las propiedades con guion bajo
//   String get estadoString => estado_string;
//   String get tipoString => tipo_string;
//   int? get ubicacionId => ubicacion_id;
// }
