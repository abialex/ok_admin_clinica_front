import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_update_model.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/request/cita_request_model.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:either_dart/either.dart';

import '../../service/cita_api.dart';

class CitaRepository implements ICitaRepository {
  CitaApi api;
  CitaRepository(this.api);

  @override
  Future<Either<String, List<CitaDTO>>> getCitaAll() async {
    return await api.getCitaAll();
  }

  @override
  Future<Either<String, bool>> confirmarCita(int id) {
    return api.confirmarCita(id);
  }

  @override
  Future<Either<String, int>> createCitaAgil(CitaAgilCreateModel citaCreate) {
    return api.createCitaAgil(citaCreate);
  }

  @override
  Future<Either<String, bool>> deleteCitaById(int id) {
    return api.deleteCitaById(id);
  }

  @override
  Future<Either<String, bool>> finalizarCita(int id) {
    return api.finalizarCita(id);
  }

  @override
  Future<Either<String, CitaDTO>> getCitaById(int id) {
    return api.getCitaById(id);
  }

  @override
  Future<Either<String, List<CitaDTO>>> getCitasByFechaIdDoctorIdUbicacion(CitaRequest citaRequest) {
    return api.getCitasByFechaIdDoctorIdUbicacion(citaRequest);
  }

  @override
  Future<Either<String, List<CitaDTO>>> getCitasFilterByIdDoctorParams(CitaFilterViewModel paramsView) {
    final params = {};
    if (paramsView.fecha != null) {
      params['date'] = paramsView.fecha!.toFormatyyyyMMddHHmmss();
    }
    if (paramsView.fecha != null) {
      params['week'] = paramsView.semana!.toFormatyyyyMMddHHmmss();
    }
    if (paramsView.fecha != null) {
      params['month'] = paramsView.mes!.toFormatyyyyMMddHHmmss();
    }

    if (paramsView.ubicacionId != null) {
      params['ubicacion_id'] = paramsView.fecha;
    }
    if (paramsView.ubicacionId != null) {
      params['doctor_id'] = paramsView.doctorId;
    }
    if (paramsView.ubicacionId != null) {
      params['tipo'] = paramsView.tipo;
    }
    return api.getCitasFilterByIdDoctorParams(params);
  }

  @override
  Future<Either<String, bool>> iniciarCita(int id) {
    return api.iniciarCita(id);
  }

  @override
  Future<Either<String, int>> updateCitaAgil(CitaAgilUpdateModel citaUpdate) {
    return api.updateCitaAgil(citaUpdate);
  }

  @override
  Future<Either<String, bool>> validarCita(int id) {
    return api.validarCita(id);
  }

  @override
  Future<Either<String, int>> createCitaOcupada(CitaOcupadaCreateModel citaCreate) {
    return api.createCitaOcupado(citaCreate);
  }

  @override
  Future<Either<String, bool>> cancelarCita(int id) {
    return api.cancelarCita(id);
  }

  @override
  Future<Either<String, List<CitaDTO>>> getUbicacionIdDateDoctorId(CitaRequestAdmin citaRequestAdmin) {
    return api.getCitasByFechaDoctorIdUbicacionId(citaRequestAdmin);
  }
}
