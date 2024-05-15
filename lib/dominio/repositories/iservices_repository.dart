import 'package:admin_clinica_front/data/models/service_external/persona_sunat_dto.dart';
import 'package:either_dart/either.dart';

abstract class IServicesRepository {
  Future<Either<String, PersonaSunatDto>> getPersonaSunatByDni(String dni);
}
