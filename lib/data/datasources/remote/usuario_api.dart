import 'package:admin_clinica_front/data/models/api_model/api_model.dart';
import 'package:admin_clinica_front/data/models/usuario/authenticated_dto.dart';
import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';
import 'package:admin_clinica_front/data/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../dominio/entities/usuario.dart';

class UsuarioApi {
  final Dio _dio;
  UsuarioApi(this._dio);

  Future<Either<String, User>> login(String name) async {
    final response = await _dio.post<ApiModel>("session/login",
        data: {"username": "slg_a_0519", "password": "0519s5762"});
    return ApiUtils.reponseHandler(
        response, (data) => UserLoginDTO.fromJson(data));
  }

  Future<Either<String, AuthenticatedDTO>> authenticated(String name) async {
    final response = await _dio.post<ApiModel>("session/login_authenticated",
        data: {"token": "slg_a_0519"});
    return ApiUtils.reponseHandler(
        response, (data) => AuthenticatedDTO.fromJson(data));
  }

  Future<Either<String, bool>> logout(String name) async {
    final response = await _dio.get<ApiModel>("session/logout");
    return ApiUtils.reponseHandler(response, (data) => data as bool);
  }
}
