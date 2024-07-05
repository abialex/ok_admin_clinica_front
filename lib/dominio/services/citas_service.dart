import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/data/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/data/models/request/cita_request_model.dart';
import 'package:admin_clinica_front/data/models/request/request_model.dart';
import 'package:admin_clinica_front/dominio/entities/estado_cita.dart';
import 'package:admin_clinica_front/dominio/entities/tipo_cita.dart';
import 'package:either_dart/either.dart';

import '../../data/models/cita/cita_agil/cita_agil_create.dart';
import '../../data/models/cita/cita_agil/cita_agil_update.dart';
import '../../ui/view_models/cita_view/cita_view_models.dart';
import '../repositories/icita_repository.dart';

class CitasService {
  final ICitaRepository _citaRepository;
  CitasService(this._citaRepository);

  Future<Either<String, int>> citaAgilCreate(CitaAgilCreateViewModel view) async {
    CitaAgilCreateModel model = CitaAgilCreateModel(
      fechaHoraCita: view.fechaHoraCita.toFormatyyyyMMddHHmmss(),
      datosPaciente: view.datosPaciente,
      doctor_id: view.doctorId,
      ubicacion_id: view.ubicacionId,
      celular: view.celular,
      razon: view.razon,
    );
    return await _citaRepository.createCitaAgil(model);
  }

  Future<Either<String, int>> citaAgilUpdate(CitaAgilUpdateViewModel view) async {
    // Aquí puedes agregar lógica de validación o preparación de datos
    CitaAgilUpdateModel model = CitaAgilUpdateModel(
      id: view.id,
      razon: view.razon,
      estado: EstadoCitaExtension.fromEstado(view.estado),
      fechaHoraCita: view.fechaHoraCita.toFormatyyyyMMddHHmmss(),
      datosPaciente: view.datosPaciente,
      doctor_id: view.doctorId,
      ubicacion_id: view.ubicacionId,
      celular: view.celular,
    );
    return await _citaRepository.updateCitaAgil(model);
  }

  Future<Either<String, List<CitasViewModel>>> getCitaAll() async {
    try {
      final result = await _citaRepository.getCitaAll();
      return result.fold(
        (error) => Left(error),
        (responseList) {
          final finalList = responseList
              .map((cita) => CitasViewModel(
                    id: cita.id,
                    fechaHoraCita: DateTime.parse(cita.fechaHoraCita),
                    estado: EstadoCitaExtension.fromNumber(cita.estado),
                    tipo: TipoCitaExtension.fromNumber(cita.estado),
                    celular: cita.celular,
                    pacienteDatos: cita.paciente != null ? "${cita.paciente!.nombres} ${cita.paciente?.apellidos}" : null,
                    razon: cita.razon,
                    razonOcupado: cita.razonOcupado,
                    datosPaciente: cita.datosPaciente,
                    estadoString: cita.estado_string,
                    tipoString: cita.tipo_string,
                    fechaConfirmacion: cita.fechaConfirmacion != null ? DateTime.parse(cita.fechaConfirmacion!) : null,
                    fechaValidacion: cita.fechaValidacion != null ? DateTime.parse(cita.fechaValidacion!) : null,
                    fechaInicio: cita.fechaInicio != null ? DateTime.parse(cita.fechaInicio!) : null,
                    fechaFin: cita.fechaFin != null ? DateTime.parse(cita.fechaFin!) : null,
                  ))
              .toList();
          return Right(finalList);
        },
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<CitasViewModel>>> getCitasByFechaIdDoctorIdUbicacion(CitaRequestViewModel view) async {
    try {
      CitaRequest request = CitaRequest(
        fechaHoraCita: view.fechaHoraCita.toFormatyyyyMMdd(),
        doctor_id: view.doctorId,
        ubicaciones_id: view.ubicacionesId,
      );
      final result = await _citaRepository.getCitasByFechaIdDoctorIdUbicacion(request);
      return result.fold(
        (error) => Left(error),
        (responseList) {
          final finalList = responseList
              .map(
                (cita) => CitasViewModel(
                  id: cita.id,
                  fechaHoraCita: DateTime.parse(cita.fechaHoraCita),
                  estado: EstadoCitaExtension.fromNumber(cita.estado),
                  tipo: TipoCitaExtension.fromNumber(cita.tipo),
                  celular: cita.celular,
                  pacienteDatos: cita.paciente != null ? "${cita.paciente!.nombres} ${cita.paciente?.apellidos}" : null,
                  razon: cita.razon,
                  razonOcupado: cita.razonOcupado,
                  datosPaciente: cita.datosPaciente,
                  estadoString: cita.estado_string,
                  tipoString: cita.tipo_string,
                  fechaConfirmacion: cita.fechaConfirmacion != null ? DateTime.parse(cita.fechaConfirmacion!) : null,
                  fechaValidacion: cita.fechaValidacion != null ? DateTime.parse(cita.fechaValidacion!) : null,
                  fechaInicio: cita.fechaInicio != null ? DateTime.parse(cita.fechaInicio!) : null,
                  fechaFin: cita.fechaFin != null ? DateTime.parse(cita.fechaFin!) : null,
                ),
              )
              .toList();
          return Right(finalList);
        },
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<CitaViewModel>>> getUbicacionIdDateDoctorId(CitaRequestAdminViewModel view) async {
    try {
      CitaRequestAdmin request = CitaRequestAdmin(
        ubicacion_id: view.ubicacionId,
        doctor_id: view.doctorId,
        fecha_inicio: view.fechaInicio?.toFormatyyyyMMdd(),
        fecha_fin: view.fechaFin?.toFormatyyyyMMdd(),
        fecha: view.fecha?.toFormatyyyyMMdd(),
      );
      final result = await _citaRepository.getUbicacionIdDateDoctorId(request);
      return result.fold(
        (error) => Left(error),
        (responseList) {
          final finalList = responseList
              .map(
                (dto) => CitaViewModel(
                  id: dto.id,
                  doctorId: dto.doctor_id,
                  ubicacionId: dto.ubicacion_id,
                  fechaHoraCita: DateTime.parse(dto.fechaHoraCita),
                  doctor: dto.doctor,
                  estadoString: dto.estado_string,
                  tipoString: dto.tipo_string,
                  tipo: TipoCitaExtension.fromNumber(dto.tipo),
                  celular: dto.celular,
                  pacienteDatos: dto.paciente != null ? "${dto.paciente!.nombres} ${dto.paciente?.apellidos}" : null,
                  razon: dto.razon,
                  razonOcupado: dto.razonOcupado,
                  datosPaciente: dto.datosPaciente,
                  estado: EstadoCitaExtension.fromNumber(dto.estado),
                  fechaConfirmacion: dto.fechaConfirmacion != null ? DateTime.parse(dto.fechaConfirmacion!) : null,
                  fechaValidacion: dto.fechaValidacion != null ? DateTime.parse(dto.fechaValidacion!) : null,
                  fechaInicio: dto.fechaInicio != null ? DateTime.parse(dto.fechaInicio!) : null,
                  fechaFin: dto.fechaFin != null ? DateTime.parse(dto.fechaFin!) : null,
                ),
              )
              .toList();
          return Right(finalList);
        },
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<CitasViewModel>>> getCitasFilterByIdDoctorParams(CitaFilterViewModel paramsView) async {
    final params = {};
    if (paramsView.fecha != null) {
      params['date'] = paramsView.fecha!.toFormatyyyyMMddHHmmss();
    }
    if (paramsView.fecha != null) {
      params['week'] = paramsView.semana!.toFormatyyyyMMddHHmmss();
    }
    if (paramsView.fecha != null) {
      params['month'] = paramsView.mes!.toFormatyyyyMMddHHmmss();
    }

    if (paramsView.ubicacionId != null) {
      params['ubicacion_id'] = paramsView.fecha;
    }
    if (paramsView.ubicacionId != null) {
      params['doctor_id'] = paramsView.doctorId;
    }
    if (paramsView.ubicacionId != null) {
      params['tipo'] = paramsView.tipo;
    }
    final result = await _citaRepository.getCitasFilterByIdDoctorParams(params);
    return result.fold(
      (error) => Left(error),
      (responseList) {
        final finalList = responseList
            .map(
              (cita) => CitasViewModel(
                id: cita.id,
                fechaHoraCita: DateTime.parse(cita.fechaHoraCita),
                estado: EstadoCitaExtension.fromNumber(cita.estado),
                tipo: TipoCitaExtension.fromNumber(cita.estado),
                celular: cita.celular,
                pacienteDatos: cita.paciente != null ? "${cita.paciente!.nombres} ${cita.paciente?.apellidos}" : null,
                razon: cita.razon,
                razonOcupado: cita.razonOcupado,
                datosPaciente: cita.datosPaciente,
                estadoString: cita.estado_string,
                tipoString: cita.tipo_string,
                fechaConfirmacion: cita.fechaConfirmacion != null ? DateTime.parse(cita.fechaConfirmacion!) : null,
                fechaValidacion: cita.fechaValidacion != null ? DateTime.parse(cita.fechaValidacion!) : null,
                fechaInicio: cita.fechaInicio != null ? DateTime.parse(cita.fechaInicio!) : null,
                fechaFin: cita.fechaFin != null ? DateTime.parse(cita.fechaFin!) : null,
              ),
            )
            .toList();
        return Right(finalList);
      },
    );
  }

  Future<Either<String, bool>> nextPaso(TipoAccionEnum tipo, int idcita) async {
    switch (tipo) {
      case TipoAccionEnum.confirmar:
        return _citaRepository.confirmarCita(idcita);
      case TipoAccionEnum.iniciar:
        return _citaRepository.iniciarCita(idcita);
      case TipoAccionEnum.finalizar:
        return _citaRepository.finalizarCita(idcita);
      case TipoAccionEnum.validar:
        return _citaRepository.validarCita(idcita);
      case TipoAccionEnum.cancelar:
        return _citaRepository.cancelarCita(idcita);
      default:
        return const Left("tipo no definido en la App");
    }
  }

  Future<Either<String, bool>> deleteCitaById(int idcita) async {
    return await _citaRepository.deleteCitaById(idcita);
  }

  Future<Either<String, CitaViewModel>> getCitaById(int citaId) async {
    try {
      final result = await _citaRepository.getCitaById(citaId);

      return result.fold(
        (error) => Left(error),
        (dto) => Right(CitaViewModel(
          id: dto.id,
          doctorId: dto.doctor_id,
          ubicacionId: dto.ubicacion_id,
          fechaHoraCita: DateTime.parse(dto.fechaHoraCita),
          doctor: dto.doctor,
          estadoString: dto.estado_string,
          tipoString: dto.tipo_string,
          tipo: TipoCitaExtension.fromNumber(dto.tipo),
          celular: dto.celular,
          pacienteDatos: dto.paciente != null ? "${dto.paciente!.nombres} ${dto.paciente?.apellidos}" : null,
          razon: dto.razon,
          razonOcupado: dto.razonOcupado,
          datosPaciente: dto.datosPaciente,
          estado: EstadoCitaExtension.fromNumber(dto.estado),
          fechaConfirmacion: dto.fechaConfirmacion != null ? DateTime.parse(dto.fechaConfirmacion!) : null,
          fechaValidacion: dto.fechaValidacion != null ? DateTime.parse(dto.fechaValidacion!) : null,
          fechaInicio: dto.fechaInicio != null ? DateTime.parse(dto.fechaInicio!) : null,
          fechaFin: dto.fechaFin != null ? DateTime.parse(dto.fechaFin!) : null,
        )),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, int>> citaOcupadaCreate(CitaOcupadaCreateViewModel view) async {
    CitaOcupadaCreateModel model = CitaOcupadaCreateModel(
      doctor_id: view.doctorId,
      fechaHoraCita: view.fechaHoraCita.toFormatyyyyMMddHHmmss(),
      razonOcupado: view.razonOcupado,
    );
    return await _citaRepository.createCitaOcupada(model);
  }
}

enum TipoAccionEnum {
  confirmar,
  iniciar,
  finalizar,
  validar,
  cancelar,
  eliminar,
}
