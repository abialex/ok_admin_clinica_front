import 'package:admin_clinica_front/config/app_flavor_config.dart';
import 'package:admin_clinica_front/infraestructura/network/inteceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class ApiClient {
  Dio setupDio() {
    var dio = Dio();
    dio.options.baseUrl = AppFlavorConfig.urlApp;
    dio.interceptors.add(AppInterceptor());
    dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    dio.interceptors.add(LogInterceptor(responseBody: true)); //para visualizar
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );
    }
    return dio;
  }

  // Dio createDioExternal() {
  //   var dio = Dio();
  //   dio.options.baseUrl = 'http://alex-ya.me:4500/';
  //   dio.options.connectTimeout = const Duration(seconds: 7); // 5 seconds
  //   dio.interceptors.add(
  //     TalkerDioLogger(
  //       settings: const TalkerDioLoggerSettings(
  //         printRequestHeaders: true,
  //         printResponseHeaders: true,
  //       ),
  //     ),
  //   );
  //   dio.interceptors.add(AppInterceptor());

  //   // dio.interceptors.add(LogInterceptor(responseBody: true));
  //   return dio;
  // }
}
