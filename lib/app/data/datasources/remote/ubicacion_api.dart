import 'package:admin_clinica_front/app/data/datasources/remote/base_api.dart';
import 'package:admin_clinica_front/app/data/models/api_model/api_model.dart';
import 'package:admin_clinica_front/app/data/models/ubicacion/ubicacion_dto.dart';
import 'package:admin_clinica_front/app/config/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class UbicacionApi implements BaseApi {
  final Dio _dio;
  @override
  String get url => "ubicaciones/ubicacion/";

  UbicacionApi(this._dio);

  Future<Either<String, List<UbicacionDto>>> getUbicacions() async {
    final response = await _dio.get<ApiModel>(
      url,
    );
    return ApiUtils.reponseHandler(response, (data) => (data as List).map((e) => UbicacionDto.fromJson(e)).toList());
  }
}
