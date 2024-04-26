import 'package:admin_clinica_front/data/models/doctor/doctors_dto.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../models/api_model/api_model.dart';
import '../../utils/api_utils.dart';

class DoctorApi {
  final Dio _dio;
  DoctorApi(this._dio);

  Future<Either<String, List<DoctorsDto>>>
      getDoctorsByIdUbicacionFromAsistente() async {
    final response = await _dio.get<ApiModel>(
      "recursos_humanos/doctores/by-ubicacion",
    );
    return ApiUtils.reponseHandler(response,
        (data) => (data as List).map((e) => DoctorsDto.fromJson(e)).toList());
  }
}
