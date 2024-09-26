import 'package:admin_clinica_front/app/data/datasources/remote/base_api.dart';
import 'package:admin_clinica_front/app/data/models/api_model/api_model.dart';
import 'package:admin_clinica_front/app/data/models/service_external/persona_sunat_dto.dart';
import 'package:admin_clinica_front/app/config/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class SunatApi implements BaseApi {
  final Dio _dio;
  SunatApi(this._dio);

  @override
  String get url => "service_external/sunat/";

  Future<Either<String, PersonaSunatDto>> getPersonaSunat(String dni) async {
    final response = await _dio.get<ApiModel>(
      "${url}persona-dni/$dni",
    );
    return ApiUtils.reponseHandler(response, (data) => PersonaSunatDto.fromJson(data));
  }
}
