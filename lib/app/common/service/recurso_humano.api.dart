import 'package:dio/dio.dart';

class RecursoHumanoApi {
  final Dio _dio;
  RecursoHumanoApi(this._dio);

  getUsuario() {
    _dio.get("pokemon/ditto");
  }
}
