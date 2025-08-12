import 'package:admin_clinica_front/app/common/models/service_external/persona_sunat_dto.dart';
import 'package:admin_clinica_front/app/common/repository/services_external/iservices_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sunat_state.dart';
part 'sunat_cubit.freezed.dart';

class SunatCubit extends Cubit<SunatState> {
  final _servicesRepository = locator<IServicesRepository>();
  SunatCubit() : super(SunatState.initial());

  Future<PersonaSunatDto?> getPersonaByDni(String dni) async {
    emit(SunatState.loading());
    final result = await _servicesRepository.getPersonaSunatByDni(dni);

    if (result.isRight) {
      if (result.right.nombres.isEmpty) {
        emit(SunatState.failure("SUNAT: Este dni fue encontrado pero sin datos"));
        return null;
      }
      emit(SunatState.sunatPersonaLoaded(result.right));

      return result.right;
    } else {
      switch (result.left) {
        case "Not Found":
          emit(SunatState.failure("el DNI no fue encontrado en la sunat"));
        case "others":
          emit(SunatState.failure("Others"));
          break;
        default:
          emit(SunatState.failure(result.left));
      }
      return null;
    }
  }

  void initial() {
    emit(SunatState.initial());
  }
}
