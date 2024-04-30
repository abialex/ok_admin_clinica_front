import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/data/models/request/request_model.dart';
import 'package:either_dart/either.dart';

import '../../data/models/cita/cita_agil/cita_agil_create.dart';
import '../../data/models/cita/cita_agil/cita_agil_update.dart';
import '../../ui/view_models/cita_view/cita_view_models.dart';
import '../repositories/icita_repository.dart';

class CitasService {
  final ICitaRepository _citaRepository;
  CitasService(this._citaRepository);

  Future<Either<String, int>> citaAgilCreate(
      CitaAgilCreateViewModel view) async {
    CitaAgilCreateModel model = CitaAgilCreateModel(
      fechaHoraCita: view.fechaHoraCita,
      datosPaciente: view.datosPaciente,
      doctor_id: view.doctorId,
      ubicacion_id: view.ubicacionId,
      celular: view.celular,
      razon: view.razon,
    );
    return await _citaRepository.createCitaAgil(model);
  }

  Future<Either<String, int>> updateCitaAgil(
      CitaAgilUpdateViewModel view) async {
    // Aquí puedes agregar lógica de validación o preparación de datos
    CitaAgilUpdateModel model = CitaAgilUpdateModel(
      id: view.id,
      razon: view.razon,
      estado: view.estado,
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
                    estado: cita.estado,
                    tipo: cita.tipo,
                    celular: cita.celular,
                    pacienteDatos: cita.paciente?.nombres,
                    razon: cita.razon,
                    razonOcupado: cita.razonOcupado,
                    datosPaciente: cita.datosPaciente,
                    estadoString: cita.estado_string,
                    tipoString: cita.tipo_string,
                    fechaConfirmacion: cita.fechaConfirmacion != null
                        ? DateTime.parse(cita.fechaConfirmacion!)
                        : null,
                    fechaValidacion: cita.fechaValidacion != null
                        ? DateTime.parse(cita.fechaValidacion!)
                        : null,
                    fechaInicio: cita.fechaInicio != null
                        ? DateTime.parse(cita.fechaInicio!)
                        : null,
                    fechaFin: cita.fechaFin != null
                        ? DateTime.parse(cita.fechaFin!)
                        : null,
                  ))
              .toList();
          return Right(finalList);
        },
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<CitasViewModel>>>
      getCitasByFechaIdDoctorIdUbicacion(CitaRequestViewModel view) async {
    try {
      CitaRequest request = CitaRequest(
        fechaHoraCita: view.fechaHoraCita,
        doctor_id: view.doctorId,
        ubicacion_id: view.ubicacionId,
      );
      final result =
          await _citaRepository.getCitasByFechaIdDoctorIdUbicacion(request);
      return result.fold(
        (error) => Left(error),
        (responseList) {
          final finalList = responseList
              .map(
                (cita) => CitasViewModel(
                  id: cita.id,
                  fechaHoraCita: DateTime.parse(cita.fechaHoraCita),
                  estado: cita.estado,
                  tipo: cita.tipo,
                  celular: cita.celular,
                  pacienteDatos: cita.paciente?.nombres,
                  razon: cita.razon,
                  razonOcupado: cita.razonOcupado,
                  datosPaciente: cita.datosPaciente,
                  estadoString: cita.estado_string,
                  tipoString: cita.tipo_string,
                  fechaConfirmacion: cita.fechaConfirmacion != null
                      ? DateTime.parse(cita.fechaConfirmacion!)
                      : null,
                  fechaValidacion: cita.fechaValidacion != null
                      ? DateTime.parse(cita.fechaValidacion!)
                      : null,
                  fechaInicio: cita.fechaInicio != null
                      ? DateTime.parse(cita.fechaInicio!)
                      : null,
                  fechaFin: cita.fechaFin != null
                      ? DateTime.parse(cita.fechaFin!)
                      : null,
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

  Future<Either<String, List<CitasViewModel>>> getCitasFilterByIdDoctorParams(
      CitaFilterViewModel paramsView) async {
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
                estado: cita.estado,
                tipo: cita.tipo,
                celular: cita.celular,
                pacienteDatos: cita.paciente?.nombres,
                razon: cita.razon,
                razonOcupado: cita.razonOcupado,
                datosPaciente: cita.datosPaciente,
                estadoString: cita.estado_string,
                tipoString: cita.tipo_string,
                fechaConfirmacion: cita.fechaConfirmacion != null
                    ? DateTime.parse(cita.fechaConfirmacion!)
                    : null,
                fechaValidacion: cita.fechaValidacion != null
                    ? DateTime.parse(cita.fechaValidacion!)
                    : null,
                fechaInicio: cita.fechaInicio != null
                    ? DateTime.parse(cita.fechaInicio!)
                    : null,
                fechaFin: cita.fechaFin != null
                    ? DateTime.parse(cita.fechaFin!)
                    : null,
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
        return const Left("falta cancelar");
      case TipoAccionEnum.eliminar:
        return _citaRepository.deleteCitaById(idcita);
      default:
        return const Left("tipo no definido");
    }
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
