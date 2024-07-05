import 'package:admin_clinica_front/data/models/api_model/api_model.dart';
import 'package:admin_clinica_front/data/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/data/models/cita/cita_agil/cita_agil_update.dart';
import 'package:admin_clinica_front/data/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/data/models/cita/citas_dto.dart';
import 'package:admin_clinica_front/data/models/request/cita_request_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../models/cita/cita_dto.dart';
import '../../models/request/request_model.dart';
import '../../utils/api_utils.dart';

class CitaApi {
  final Dio _dio;
  CitaApi(this._dio);

  Future<Either<String, CitaDTO>> getCitaById(int id) async {
    final response = await _dio.get<ApiModel>("citas/cita/$id/");
    return ApiUtils.reponseHandler(response, (data) => CitaDTO.fromJson(data));
  }

  Future<Either<String, List<CitasDTO>>> getCitaAll() async {
    final response = await _dio.get<ApiModel>("citas/cita/");
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => CitasDTO.fromJson(e)).toList());
  }

  Future<Either<String, bool>> deleteCitaById(int id) async {
    final response = await _dio.delete<ApiModel>("citas/cita/$id/");
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, bool>> confirmarCita(int id) async {
    final response = await _dio.get<ApiModel>(
      "citas/cita_confirmar/by-id",
      queryParameters: {"id": id},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, bool>> iniciarCita(int id) async {
    final response = await _dio.get<ApiModel>(
      "citas/cita_iniciar/by-id",
      queryParameters: {"id": id},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, bool>> finalizarCita(int id) async {
    final response = await _dio.get<ApiModel>(
      "citas/cita_finalizar/by-id",
      queryParameters: {"id": id},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, bool>> validarCita(int id) async {
    final response = await _dio.get<ApiModel>(
      "citas/cita_validar/by-id",
      queryParameters: {"id": id},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, List<CitasDTO>>> getCitasByFechaIdDoctorIdUbicacion(CitaRequest citaRequest) async {
    final response = await _dio.post<ApiModel>(
      "citas/citas-by-fecha-iddoctor-idubicacion",
      data: citaRequest.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => CitasDTO.fromJson(e)).toList());
  }

  Future<Either<String, List<CitasDTO>>> getCitasFilterByIdDoctorParams(dynamic params) async {
    params = params.isEmpty ? null : params;

    final response = await _dio.get<ApiModel>(
      "citas/citas-list-filter-by-iddoctor/",
      queryParameters: params,
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => CitasDTO.fromJson(e)).toList());
  }

  Future<Either<String, int>> createCitaAgil(CitaAgilCreateModel citaCreate) async {
    final response = await _dio.post<ApiModel>(
      "citas/cita_agil_create",
      data: citaCreate.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => (data as int));
  }

  Future<Either<String, int>> updateCitaAgil(CitaAgilUpdateModel citaUpdate) async {
    final response = await _dio.post<ApiModel>(
      "citas/cita_agil_update",
      data: citaUpdate.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => (data as int));
  }

  Future<Either<String, int>> createCitaOcupado(CitaOcupadaCreateModel citaCreate) async {
    final response = await _dio.post<ApiModel>(
      "citas/cita_ocupado_create",
      data: citaCreate.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => (data as int));
  }

  Future<Either<String, bool>> cancelarCita(int id) async {
    final response = await _dio.get<ApiModel>(
      "citas/cita_cancelar/by-id",
      queryParameters: {"id": id},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, List<CitaDTO>>> getCitasByFechaDoctorIdUbicacionId(CitaRequestAdmin citaRequest) async {
    final response = await _dio.post<ApiModel>(
      "citas/cita_by_date_location_doctor/",
      data: citaRequest.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => CitaDTO.fromJson(e)).toList());
  }
}
