import 'package:dio/dio.dart';

class HistoriaClinicaApi {
  final Dio _dio;
  HistoriaClinicaApi(this._dio);

  getUsuario() {
    _dio.get("pokemon/ditto");
  }
}
