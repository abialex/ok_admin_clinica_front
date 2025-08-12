import 'package:admin_clinica_front/app/common/service/sunat_api.dart';
import 'package:admin_clinica_front/app/common/models/service_external/persona_sunat_dto.dart';
import 'package:admin_clinica_front/app/common/repository/services_external/iservices_repository.dart';
import 'package:either_dart/either.dart';

class ServicesRepository implements IServicesRepository {
  SunatApi api;

  ServicesRepository(this.api);
  @override
  Future<Either<String, PersonaSunatDto>> getPersonaSunatByDni(String dni) {
    return api.getPersonaSunat(dni);
  }
}
