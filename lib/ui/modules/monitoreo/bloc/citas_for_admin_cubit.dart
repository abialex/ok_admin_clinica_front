import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:bloc/bloc.dart';

class CitasForAdminCubit extends Cubit<List<CitaViewModel>> {
  CitasForAdminCubit() : super([]);

  final service = locator<CitasService>();

  void getCitasByFilter(CitaRequestAdminViewModel request) async {
    final result = await service.getUbicacionIdDateDoctorId(request);
    if (result.isRight) {
      emit(result.right);
    } else {
      emit([]);
    }
  }

  void clear() {
    emit([]);
  }
}
