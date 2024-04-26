import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/data/datasources/local/auth_service.dart';
import 'package:admin_clinica_front/data/models/api_model/api_model.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AuthService authService = locator<AuthService>();

    // Añadir token de autenticación a todas las solicitudes si está disponible
    final token =
        await authService.getToken(); // Deberías obtener esto de manera segura
    options.headers["Authorization"] = "$token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // Manejar respuesta
    ApiModel apiModel = ApiModel.fromJson(response.data);
    response.data = apiModel;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    // Manejar errores de solicitud
    ApiModel apiModel = ApiModel.fromJson(error.response?.data);
    error.response?.data = apiModel;
    handler.resolve(error.response!);
    // super.onError(error, handler);
  }
}

class AppInterceptorEncrypt extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AuthService authService = locator<AuthService>();

    // Añadir token de autenticación a todas las solicitudes si está disponible
    final token =
        await authService.getToken(); // Deberías obtener esto de manera segura
    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Manejar respuesta
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Manejar errores de solicitud
    super.onError(err, handler);
  }
}
