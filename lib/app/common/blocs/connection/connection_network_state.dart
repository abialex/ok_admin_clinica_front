part of 'connection_network_bloc.dart';

@freezed
class ConnectionNetworkState with _$ConnectionNetworkState {
  const factory ConnectionNetworkState.initial() = _Initial;
  const factory ConnectionNetworkState.wifi() = WifiState;
  const factory ConnectionNetworkState.datosMobile() = DatosMobileState;
  const factory ConnectionNetworkState.sinConexion() = SinConeccionState;
}
