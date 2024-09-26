import 'package:admin_clinica_front/app/ui/view_models/local_view/local_view_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/app_dependecy_injection.dart';
import '../../../../dominio/services/local_service.dart';
import '../../../view_models/usuario_view/usuario_view_models.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _localService = locator<LocalService>();

  HomeBloc() : super(_Initial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetupUsuarioEvent>((event, emit) {
      emit(state.copyWith(usuario: event.usuario));
    });
    getUsuario();
  }

  getUsuario() async {
    final result = await _localService.getUsuario();
    add(SetupUsuarioEvent(result));
  }
}
