import 'package:dio/dio.dart';

class FirebaseApi {
  final Dio _dio;
  FirebaseApi(this._dio);

  getUsuario() {
    _dio.get("pokemon/ditto");
  }
}
