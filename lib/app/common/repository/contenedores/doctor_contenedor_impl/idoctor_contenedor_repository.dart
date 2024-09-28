import 'package:admin_clinica_front/app/common/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/common/models/filter_model/filter_model.dart';
import 'package:either_dart/either.dart';

abstract class IDoctorContenedorLocalRepository {
  // Future<List<DoctorContenedorDataModel>> getLocalSunatContenedors();
  Future<Either<String, List<DoctorContenedorDataModel>>> getLocalDoctorContenedorByFilter(FilterModel filter);
  // Future<void> saveLocalSunatContenedors(List<DoctorContenedorDataModel> models);
  // Future<void> saveLocalSunatContenedor(DoctorContenedorDataModel model);
  // Future<void> updateLocalSunatContenedor(DoctorContenedorDataModel model);
  // Future<void> deleteLocalSunatContenedor(int productId);
}
