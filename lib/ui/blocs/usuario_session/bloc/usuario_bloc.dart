import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/di/injections.dart';
import '../../../../dominio/services/local_service.dart';
import '../../../view_models/usuario_view/usuario_view_models.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';
part 'usuario_bloc.freezed.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final _localService = locator<LocalService>();

  UsuarioBloc() : super(const _Initial()) {
    on<SetupUsuarioEvent>((event, emit) {
      emit(state.copyWith(usuario: event.usuario));
    });
    on<SetUsuarioEvent>((event, emit) {
      emit(state.copyWith(usuario: event.usuario));
    });
  }
  getUsuario() async {
    final result = await _localService.getUsuario();
    add(SetupUsuarioEvent(result));
  }

  setUsuario(UsuarioLoginResponseViewModel usuario) async {
    await _localService.saveUsuario(usuario);
    await _localService.saveToken(usuario.token);
    add(SetUsuarioEvent(usuario));
  }
}
