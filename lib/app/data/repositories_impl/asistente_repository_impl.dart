import 'package:admin_clinica_front/app/data/models/asistente/asistente_create_model.dart';
import 'package:admin_clinica_front/app/data/models/asistente/asistente_credentials_model.dart';
import 'package:admin_clinica_front/app/data/models/asistente/asistente_dto.dart';
import 'package:admin_clinica_front/app/data/models/asistente/asistente_update_model.dart';
import 'package:admin_clinica_front/app/data/models/asistente/asistentes_dto.dart';
import 'package:either_dart/either.dart';

import '../../dominio/repositories/iasistente_repository.dart';
import '../datasources/remote/asistente_api.dart';

class AsistenteRepository implements IAsistenteRepository {
  AsistenteApi api;
  AsistenteRepository(this.api);

  @override
  Future<Either<String, AsistenteCredentialsDto>> createAsistente(AsistenteCreateModel doctorCreateModel) {
    return api.createAsistente(doctorCreateModel);
  }

  @override
  Future<Either<String, List<AsistentesDto>>> getAsistentes() {
    return api.getAsistentes();
  }

  @override
  Future<Either<String, AsistenteDto>> getAsistentessById(int idasistente) {
    return api.getAsistentessById(idasistente);
  }

  @override
  Future<Either<String, int>> updateAsistente(AsistenteUpdateModel doctorUpdateModel) {
    return api.updateAsistente(doctorUpdateModel);
  }
}
