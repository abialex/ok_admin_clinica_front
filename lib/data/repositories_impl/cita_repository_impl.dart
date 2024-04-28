import 'package:admin_clinica_front/data/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/data/models/cita/cita_agil/cita_agil_update.dart';
import 'package:admin_clinica_front/data/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/data/models/cita/citas_dto.dart';
import 'package:admin_clinica_front/data/models/request/request_model.dart';
import 'package:admin_clinica_front/dominio/repositories/icita_repository.dart';
import 'package:either_dart/either.dart';

import '../datasources/remote/cita_api.dart';

class CitaRepository implements ICitaRepository {
  CitaApi api;
  CitaRepository(this.api);

  @override
  Future<Either<String, List<CitasDTO>>> getCitaAll() async {
    return await api.getCitaAll();
  }

  @override
  Future<Either<String, bool>> confirmarCita(int id) {
    return api.confirmarCita(id);
  }

  @override
  Future<Either<String, int>> createCitaAgil(CitaAgilCreateModel citaCreate) {
    return api.createCitaAgil(citaCreate);
  }

  @override
  Future<Either<String, bool>> deleteCitaById(int id) {
    return api.deleteCitaById(id);
  }

  @override
  Future<Either<String, bool>> finalizarCita(int id) {
    return api.finalizarCita(id);
  }

  @override
  Future<Either<String, CitaDTO>> getCitaById(int id) {
    return api.getCitaById(id);
  }

  @override
  Future<Either<String, List<CitasDTO>>> getCitasByFechaIdDoctorIdUbicacion(
      CitaRequest citaRequest) {
    return api.getCitasByFechaIdDoctorIdUbicacion(citaRequest);
  }

  @override
  Future<Either<String, List<CitasDTO>>> getCitasFilterByIdDoctorParams(
      params) {
    return api.getCitasFilterByIdDoctorParams(params);
  }

  @override
  Future<Either<String, bool>> iniciarCita(int id) {
    return api.iniciarCita(id);
  }

  @override
  Future<Either<String, int>> updateCitaAgil(CitaAgilUpdateModel citaUpdate) {
    return api.updateCitaAgil(citaUpdate);
  }

  @override
  Future<Either<String, bool>> validarCita(int id) {
    return api.validarCita(id);
  }
}
