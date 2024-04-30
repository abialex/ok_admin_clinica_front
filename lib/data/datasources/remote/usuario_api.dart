import 'package:admin_clinica_front/data/datasources/remote/base_api.dart';
import 'package:admin_clinica_front/data/models/api_model/api_model.dart';
import 'package:admin_clinica_front/data/models/usuario/authenticated_dto.dart';
import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';
import 'package:admin_clinica_front/data/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../models/usuario/login_user_dto.dart';

class UsuarioApi implements BaseApi {
  final Dio _dio;
  @override
  String get url => "session/";
  UsuarioApi(this._dio);

  Future<Either<String, UserLoginDTO>> login(LoginUserDto loginUserDto) async {
    final response = await _dio.post<ApiModel>(
      "${url}login",
      data: loginUserDto.toJson(),
    );
    return ApiUtils.reponseHandler(
        response, (data) => UserLoginDTO.fromJson(data));
  }

  Future<Either<String, AuthenticatedDTO>> authenticated(String token) async {
    final response = await _dio.post<ApiModel>(
      "${url}login_authenticated",
      data: {"token": token},
    );
    return ApiUtils.reponseHandler(
        response, (data) => AuthenticatedDTO.fromJson(data));
  }

  Future<Either<String, bool>> logout() async {
    final response = await _dio.get<ApiModel>("${url}logout");
    return ApiUtils.reponseHandler(response, (data) => data as bool);
  }
}
