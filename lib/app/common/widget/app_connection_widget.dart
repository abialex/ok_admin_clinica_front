import 'package:admin_clinica_front/app/common/blocs/connection/connection_network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppConnectionWidget extends StatelessWidget {
  const AppConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConnectionNetworkBloc>();
    return BlocBuilder<ConnectionNetworkBloc, ConnectionNetworkState>(
      bloc: bloc..add(const ConnectionNetworkEvent.initial()),
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return const CircularProgressIndicator();
          },
          wifi: (value) {
            return const Icon(Icons.wifi);
          },
          datosMobile: (value) {
            return const Icon(Icons.wifi);
          },
          sinConexion: (value) {
            return const Icon(Icons.wifi_off_outlined);
          },
        );
      },
    );
  }
}
