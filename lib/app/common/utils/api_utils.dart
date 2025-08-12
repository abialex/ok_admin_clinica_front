import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../config/http_status_codes.dart';
import '../models/api_model/api_model.dart';

class ApiUtils {
  static Either<String, T> reponseHandler<T>(Response<ApiModel> response, T Function(dynamic) callToJson) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return Right(callToJson(response.data?.data));
      case HttpStatusCodesApp.serverConnectionError:
        return Left(response.statusMessage ?? "Error no definido en la app");

      default:
        return Left(response.data!.message);
    }
  }
}
