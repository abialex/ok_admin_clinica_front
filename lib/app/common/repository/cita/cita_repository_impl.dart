import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_update_model.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/request/cita_request_model.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/repository/cita/i_cita_repository.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/modules/cita/model/cita_filter_data_model.dart';
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
  Future<Either<String, List<CitaDTO>>> getCitasFilterByIdDoctorParams(CitaFilterDataModel paramsView) {
    final params = <String, dynamic>{};
    if (paramsView.fecha != null) {
      params['date'] = paramsView.fecha!.toFormatyyyyMMdd();
    }
    if (paramsView.semana != null) {
      params['week'] = paramsView.semana!.toFormatyyyyMMdd();
    }
    if (paramsView.mes != null) {
      params['month'] = paramsView.mes!.toFormatyyyyMMdd();
    }
    if (paramsView.ubicacionId != null) {
      params['ubicacion_id'] = paramsView.ubicacionId;
    }
    if (paramsView.doctorId != null) {
      params['doctor_id'] = paramsView.doctorId;
    }
    if (paramsView.tipo != null) {
      params['tipo'] = paramsView.tipo;
    }
    if (paramsView.estado != null) {
      params['estado'] = paramsView.estado;
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
