import 'package:either_dart/either.dart';

import '../../data/models/cita/cita_agil/cita_agil_create.dart';
import '../../data/models/cita/cita_agil/cita_agil_update.dart';
import '../../data/models/cita/cita_dto.dart';
import '../../data/models/cita/citas_dto.dart';
import '../../data/models/request/request_model.dart';

abstract class ICitaRepository {
  Future<Either<String, List<CitasDTO>>> getCitaAll();
  Future<Either<String, CitaDTO>> getCitaById(int id);
  Future<Either<String, bool>> deleteCitaById(int id);
  Future<Either<String, bool>> confirmarCita(int id);
  Future<Either<String, bool>> iniciarCita(int id);
  Future<Either<String, bool>> finalizarCita(int id);
  Future<Either<String, bool>> validarCita(int id);
  Future<Either<String, List<CitasDTO>>> getCitasByFechaIdDoctorIdUbicacion(
      CitaRequest citaRequest);
  Future<Either<String, List<CitasDTO>>> getCitasFilterByIdDoctorParams(
      dynamic params);
  Future<Either<String, int>> createCitaAgil(CitaAgilCreateModel citaCreate);
  Future<Either<String, int>> updateCitaAgil(CitaAgilUpdateModel citaUpdate);
}
