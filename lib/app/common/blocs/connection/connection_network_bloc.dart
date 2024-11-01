import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_network_event.dart';
part 'connection_network_state.dart';
part 'connection_network_bloc.freezed.dart';

class ConnectionNetworkBloc extends Bloc<ConnectionNetworkEvent, ConnectionNetworkState> {
  ConnectionNetworkBloc() : super(const _Initial()) {
    on<InitialConnectionEvent>(initial);
    on<changeStateEvent>(changeState);
  }
  // final Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult>? subscription;

  Future<void> initial(InitialConnectionEvent event, Emitter<ConnectionNetworkState> emit) async {
    // if (event.state == ConnectivityResult.wifi) {
    //   emit(const ConnectionNetworkState.wifi());
    // } else if (event.state == ConnectivityResult.mobile) {
    //   emit(const ConnectionNetworkState.datosMobile());
    // } else if (event.state == ConnectivityResult.none) {
    //   emit(const ConnectionNetworkState.sinConexion());
    // }
  }

  Future<void> changeState(changeStateEvent event, Emitter<ConnectionNetworkState> emit) async {
    if (event.state == ConnectivityResult.wifi) {
      emit(const ConnectionNetworkState.wifi());
    } else if (event.state == ConnectivityResult.mobile) {
      emit(const ConnectionNetworkState.datosMobile());
    } else if (event.state == ConnectivityResult.none) {
      emit(const ConnectionNetworkState.sinConexion());
    }
  }
}
