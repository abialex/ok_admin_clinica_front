import 'package:admin_clinica_front/data/datasources/remote/sunat_api.dart';
import 'package:admin_clinica_front/data/models/service_external/persona_sunat_dto.dart';
import 'package:admin_clinica_front/dominio/repositories/iservices_repository.dart';
import 'package:either_dart/either.dart';

class ServicesRepository implements IServicesRepository {
  SunatApi api;

  ServicesRepository(this.api);
  @override
  Future<Either<String, PersonaSunatDto>> getPersonaSunatByDni(String dni) {
    return api.getPersonaSunat(dni);
  }
}
