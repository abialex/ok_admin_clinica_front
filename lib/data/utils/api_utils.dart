import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../models/api_model/api_model.dart';

class ApiUtils {
  static Either<String, T> reponseHandler<T>(
      Response<ApiModel> response, T Function(dynamic) callToJson) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(callToJson(response.data?.data));
    }
    return Left(response.data!.message);
  }
}
