import 'package:admin_clinica_front/data/datasources/remote/base_api.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_create_model.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_credentials_model.dart';
import 'package:admin_clinica_front/data/models/doctor/doctors_dto.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../models/api_model/api_model.dart';
import '../../models/doctor/doctor_dto.dart';
import '../../models/doctor/doctor_update_model.dart';
import '../../utils/api_utils.dart';

class DoctorApi implements BaseApi {
  final Dio _dio;
  @override
  String get url => "recursos_humanos/doctores/";

  DoctorApi(this._dio);

  Future<Either<String, List<DoctorsDto>>> getDoctorsByIdUbicacionFromAsistente() async {
    final response = await _dio.get<ApiModel>(
      "${url}by-ubicacion",
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => DoctorsDto.fromJson(e)).toList());
  }

  Future<Either<String, List<DoctorsDto>>> getDoctors() async {
    final response = await _dio.get<ApiModel>(
      "${url}doctor/",
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => DoctorsDto.fromJson(e)).toList());
  }

  Future<Either<String, DoctorDto>> getDoctorsById(int iddoctor) async {
    final response = await _dio.get<ApiModel>(
      "${url}doctor/$iddoctor/",
    );
    return ApiUtils.reponseHandler(response, (data) => DoctorDto.fromJson(data));
  }

  Future<Either<String, DoctorCredentialsDto>> createDoctor(DoctorCreateModel doctorCreateModel) async {
    final response = await _dio.post<ApiModel>(
      "${url}doctor/",
      data: doctorCreateModel.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => DoctorCredentialsDto.fromJson(data));
  }

  Future<Either<String, int>> updateDoctor(DoctorUpdateModel doctorUpdateModel) async {
    final response = await _dio.put<ApiModel>(
      "${url}doctor/${doctorUpdateModel.id}/",
      data: doctorUpdateModel.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => data as int);
  }

  Future<Either<String, bool>> activarDoctor(int doctorId) async {
    final response = await _dio.get<ApiModel>(
      "${url}doctor-activar/by-id",
      queryParameters: {"id": doctorId},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, bool>> inactivarDoctor(int doctorId) async {
    final response = await _dio.get<ApiModel>(
      "${url}doctor-inactivar/by-id",
      queryParameters: {"id": doctorId},
    );
    return ApiUtils.reponseHandler(response, (data) => (data as bool));
  }

  Future<Either<String, List<DoctorsDto>>> getDoctorByUserDoctor() async {
    final response = await _dio.get<ApiModel>(
      "${url}by-doctor_user",
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => DoctorsDto.fromJson(e)).toList());
  }
}
