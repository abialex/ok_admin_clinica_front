part of 'connection_network_bloc.dart';

@freezed
class ConnectionNetworkEvent with _$ConnectionNetworkEvent {
  const factory ConnectionNetworkEvent.initial() = InitialConnectionEvent;
  const factory ConnectionNetworkEvent.changeState(ConnectivityResult state) = changeStateEvent;
}
