import 'package:admin_clinica_front/app/dominio/entities/paciente.dart';

class Cita {
  final int? id;
  final int? doctorId;
  final String? doctor;
  final int? ubicacionId;
  final String? ubicacion;
  final String? estadoString;
  final String? tipoString;
  final String? fechaHoraCita;
  final int? estado;
  final int? tipo;
  final String? razon;
  final String? razonOcupado;
  final String? datosPaciente;
  final String? celular;
  final DateTime? fechaConfirmacion;
  final DateTime? fechaValidacion;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final Paciente? paciente;

  Cita({
    this.id,
    this.doctorId,
    this.doctor,
    this.ubicacionId,
    this.ubicacion,
    this.estadoString,
    this.tipoString,
    this.fechaHoraCita,
    this.estado,
    this.tipo,
    this.razon,
    this.razonOcupado,
    this.datosPaciente,
    this.celular,
    this.fechaConfirmacion,
    this.fechaValidacion,
    this.fechaInicio,
    this.fechaFin,
    this.paciente,
  });

  // factory Cita.fromJson(Map<String, dynamic> json) {
  //   return Cita(
  //     id: json['id'],
  //     doctorId: json['doctor_id'],
  //     doctor: json['doctor'],
  //     ubicacionId: json['ubicacion_id'],
  //     ubicacion: json['ubicacion'],
  //     estadoString: json['estado_string'],
  //     tipoString: json['tipo_string'],
  //     fechaHoraCita: json['fechaHoraCita'] != null ? DateTime.parse(json['fechaHoraCita']) : null,
  //     estado: json['estado'],
  //     tipo: json['tipo'],
  //     razon: json['razon'],
  //     razonOcupado: json['razonOcupado'],
  //     datosPaciente: json['datosPaciente'],
  //     celular: json['celular'],
  //     fechaConfirmacion: json['fechaConfirmacion'] != null ? DateTime.parse(json['fechaConfirmacion']) : null,
  //     fechaValidacion: json['fechaValidacion'] != null ? DateTime.parse(json['fechaValidacion']) : null,
  //     fechaInicio: json['fechaInicio'] != null ? DateTime.parse(json['fechaInicio']) : null,
  //     fechaFin: json['fechaFin'] != null ? DateTime.parse(json['fechaFin']) : null,
  //     paciente: json['paciente'],
  //   );
  // }
}
