import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/request/cita_request_model.dart';
import 'package:admin_clinica_front/app/modules/cita/model/cita_filter_data_model.dart';
import 'package:either_dart/either.dart';

import '../../models/cita/cita_agil/cita_agil_create.dart';
import '../../models/cita/cita_agil/cita_agil_update_model.dart';
import '../../models/cita/cita_dto.dart';
import '../../models/request/request_model.dart';

abstract class ICitaRepository {
  Future<Either<String, List<CitaDTO>>> getCitaAll();
  Future<Either<String, CitaDTO>> getCitaById(int id);
  Future<Either<String, bool>> deleteCitaById(int id);
  Future<Either<String, bool>> confirmarCita(int id);
  Future<Either<String, bool>> iniciarCita(int id);
  Future<Either<String, bool>> finalizarCita(int id);
  Future<Either<String, bool>> validarCita(int id);
  Future<Either<String, bool>> cancelarCita(int id);
  Future<Either<String, List<CitaDTO>>> getCitasByFechaIdDoctorIdUbicacion(CitaRequest citaRequest);
  Future<Either<String, List<CitaDTO>>> getUbicacionIdDateDoctorId(CitaRequestAdmin citaRequestAdmin);
  Future<Either<String, List<CitaDTO>>> getCitasFilterByIdDoctorParams(CitaFilterViewModel params);
  Future<Either<String, int>> createCitaAgil(CitaAgilCreateModel citaCreate);
  Future<Either<String, int>> updateCitaAgil(CitaAgilUpdateModel citaUpdate);
  Future<Either<String, int>> createCitaOcupada(CitaOcupadaCreateModel citaCreate);
}
