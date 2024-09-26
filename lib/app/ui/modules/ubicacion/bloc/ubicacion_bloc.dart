import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/dominio/services/ubicacion_service.dart';
import 'package:admin_clinica_front/app/ui/view_models/ubicacion_view/ubicacion_view.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ubicacion_event.dart';
part 'ubicacion_state.dart';
part 'ubicacion_bloc.freezed.dart';

class UbicacionBloc extends Bloc<UbicacionEvent, UbicacionState> {
  final UbicacionService _ubicacionService = locator<UbicacionService>();

  UbicacionBloc() : super(UbicacionState.initial()) {
    on<GetUbicaciones>(getUbicacions);
  }

  Future<void> getUbicacions(GetUbicaciones event, Emitter<UbicacionState> emit) async {
    final results = await _ubicacionService.getUbicaciones();
    results.fold(
      (left) => emit(UbicacionState.failure(left)),
      (right) {
        emit(UbicacionState.ubicacionLoaded(right));
      },
    );
  }
}
