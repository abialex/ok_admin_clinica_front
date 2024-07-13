import 'package:admin_clinica_front/dominio/entities/estado_cita.dart';
import 'package:admin_clinica_front/dominio/entities/tipo_cita.dart';

class CitaViewModel {
  final int id;
  final String doctor;
  final int doctorId;
  final int? ubicacionId;
  final String estadoString;
  final String tipoString;
  final DateTime fechaHoraCita;
  final EstadoCita estado;
  final TipoCita tipo;
  final String? razon;
  final String? razonOcupado;
  final String? datosPaciente;
  final String? celular;
  final DateTime? fechaConfirmacion;
  final DateTime? fechaValidacion;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final int? pacienteId;
  final String? pacienteDatos;

  CitaViewModel({
    required this.id,
    required this.doctor,
    required this.doctorId,
    this.ubicacionId,
    required this.estadoString,
    required this.tipoString,
    required this.fechaHoraCita,
    required this.estado,
    required this.tipo,
    this.razon,
    this.razonOcupado,
    this.datosPaciente,
    this.celular,
    this.fechaConfirmacion,
    this.fechaValidacion,
    this.fechaInicio,
    this.fechaFin,
    this.pacienteId,
    this.pacienteDatos,
  });
}

class CitasViewModel {
  final int id;
  final DateTime fechaHoraCita;
  final EstadoCita estado;
  final TipoCita tipo;
  final String? celular;
  final String? pacienteDatos;
  final String? razon;
  final String? razonOcupado;
  final String? datosPaciente;
  final String estadoString;
  final String tipoString;
  final DateTime? fechaConfirmacion;
  final DateTime? fechaValidacion;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final String? ubicacion;
  final int? ubicacionId;

  CitasViewModel({
    required this.id,
    required this.fechaHoraCita,
    required this.estado,
    required this.tipo,
    this.celular,
    this.pacienteDatos,
    this.razon,
    this.razonOcupado,
    this.datosPaciente,
    required this.estadoString,
    required this.tipoString,
    this.fechaConfirmacion,
    this.fechaValidacion,
    this.fechaInicio,
    this.fechaFin,
    this.ubicacion,
    this.ubicacionId,
  });
}

class CitaAgilCreateViewModel {
  final int doctorId;
  final int ubicacionId;
  final DateTime fechaHoraCita;
  final String datosPaciente;
  final String? razon;
  final String? celular;

  CitaAgilCreateViewModel({
    required this.doctorId,
    required this.ubicacionId,
    required this.fechaHoraCita,
    required this.datosPaciente,
    this.razon,
    this.celular,
  });
}

class CitaAgilUpdateViewModel {
  final int id;
  final int doctorId;
  final int ubicacionId;
  final DateTime fechaHoraCita;
  final String datosPaciente;
  final EstadoCita estado;
  final String? razon;
  final String? celular;

  CitaAgilUpdateViewModel({
    required this.id,
    required this.doctorId,
    required this.ubicacionId,
    required this.fechaHoraCita,
    required this.datosPaciente,
    required this.estado,
    this.razon,
    this.celular,
  });
}

class CitaRequestViewModel {
  final int doctorId;
  final List<int> ubicacionesId;
  final DateTime fechaHoraCita;

  CitaRequestViewModel({
    required this.doctorId,
    required this.ubicacionesId,
    required this.fechaHoraCita,
  });
}

class CitaRequestAdminViewModel {
  int? doctorId;
  int ubicacionId;
  DateTime? fecha;
  DateTime? fechaInicio;
  DateTime? fechaFin;

  CitaRequestAdminViewModel({
    this.doctorId,
    required this.ubicacionId,
    this.fecha,
    this.fechaInicio,
    this.fechaFin,
  });
}

class CitaFilterViewModel {
  final int? doctorId;
  final int? ubicacionId;
  final String? tipo;
  final DateTime? fecha;
  final DateTime? semana;
  final DateTime? mes;

  CitaFilterViewModel({
    this.doctorId,
    this.ubicacionId,
    this.tipo,
    this.fecha,
    this.semana,
    this.mes,
  });
}

class CitaOcupadaCreateViewModel {
  final int doctorId;
  final DateTime fechaHoraCita;
  final String? razonOcupado;

  CitaOcupadaCreateViewModel({
    required this.doctorId,
    required this.fechaHoraCita,
    this.razonOcupado,
  });
}

class CitaOcupadaUpdateViewModel {
  final int id;
  final int doctorId;
  final DateTime fechaHoraCita;
  final String razonOcupado;
  CitaOcupadaUpdateViewModel({
    required this.id,
    required this.doctorId,
    required this.fechaHoraCita,
    required this.razonOcupado,
  });
}
