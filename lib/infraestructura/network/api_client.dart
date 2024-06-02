import 'package:admin_clinica_front/infraestructura/network/inteceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio createDioLocal() {
    var dio = Dio();
    dio.options.baseUrl = 'http://192.168.100.192:8000/';
    dio.interceptors.add(AppInterceptor());
    dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    dio.interceptors.add(LogInterceptor(responseBody: true)); //para visualizar
    // dio.options.validateStatus = (status) {
    //   print(status);
    //   return true;
    // };
    return dio;
  }

  Dio createDioExternal() {
    var dio = Dio();
    dio.options.baseUrl = 'http://alex-ya.me:4500/';
    dio.options.connectTimeout = const Duration(seconds: 7); // 5 seconds
    dio.interceptors.add(AppInterceptor());
    // dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
