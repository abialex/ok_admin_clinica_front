import 'package:admin_clinica_front/data/datasources/remote/base_api.dart';
import 'package:admin_clinica_front/data/models/asistente/asistentes_dto.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../models/api_model/api_model.dart';
import '../../models/asistente/asistente_create_model.dart';
import '../../models/asistente/asistente_credentials_model.dart';
import '../../models/asistente/asistente_dto.dart';
import '../../models/asistente/asistente_update_model.dart';
import '../../utils/api_utils.dart';

class AsistenteApi implements BaseApi {
  final Dio _dio;
  @override
  String get url => "recursos_humanos/asistentes/";

  AsistenteApi(this._dio);

  Future<Either<String, List<AsistentesDto>>> getAsistentes() async {
    final response = await _dio.get<ApiModel>(
      "${url}asistente/",
    );
    return ApiUtils.reponseHandler(
        response,
        (data) =>
            (data as List).map((e) => AsistentesDto.fromJson(e)).toList());
  }

  Future<Either<String, AsistenteDto>> getAsistentessById(
      int idasistente) async {
    final response = await _dio.get<ApiModel>(
      "${url}asistente/$idasistente/",
    );
    return ApiUtils.reponseHandler(
        response, (data) => AsistenteDto.fromJson(data));
  }

  Future<Either<String, AsistenteCredentialsDto>> createAsistente(
      AsistenteCreateModel doctorCreateModel) async {
    final response = await _dio.post<ApiModel>(
      "${url}asistente/",
      data: doctorCreateModel.toJson(),
    );
    return ApiUtils.reponseHandler(
        response, (data) => AsistenteCredentialsDto.fromJson(data));
  }

  Future<Either<String, int>> updateAsistente(
      AsistenteUpdateModel doctorUpdateModel) async {
    final response = await _dio.put<ApiModel>(
      "${url}asistente/${doctorUpdateModel.id}/",
      data: doctorUpdateModel.toJson(),
    );
    return ApiUtils.reponseHandler(response, (data) => data as int);
  }
}
