import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _localService = locator<ILocalRepository>();

  HomeBloc() : super(const _Initial()) {
    on<HomeEvent>((event, emit) {});

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
