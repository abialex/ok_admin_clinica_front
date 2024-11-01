import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_dto.dart';
import 'package:admin_clinica_front/app/common/repository/ubicacion/iubicacion_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ubicacion_event.dart';
part 'ubicacion_state.dart';
part 'ubicacion_bloc.freezed.dart';

class UbicacionBloc extends Bloc<UbicacionEvent, UbicacionState> {
  final _ubicacionRepository = locator.get<IUbicacionRepository>();

  UbicacionBloc() : super(UbicacionState.initial()) {
    on<GetUbicaciones>(getUbicacions);
  }

  Future<void> getUbicacions(GetUbicaciones event, Emitter<UbicacionState> emit) async {
    final results = await _ubicacionRepository.getUbicaciones();
    results.fold(
      (left) => emit(UbicacionState.failure(left)),
      (right) {
        emit(UbicacionState.ubicacionLoaded(right));
      },
    );
  }
}
