import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:either_dart/either.dart';

abstract class IUbicacionContenedorLocalRepository {
  Future<Either<String, List<UbicacionContenedorDataModel>>> getLocalSunatContenedors();
  // Future<Either<String, List<DoctorContenedorDataModel>>> getLocalSunatContenedorByFilter(FilterModel filter);
  // Future<void> saveLocalSunatContenedors(List<DoctorContenedorDataModel> models);
  // Future<void> saveLocalSunatContenedor(DoctorContenedorDataModel model);
  // Future<void> updateLocalSunatContenedor(DoctorContenedorDataModel model);
  // Future<void> deleteLocalSunatContenedor(int productId);
}
