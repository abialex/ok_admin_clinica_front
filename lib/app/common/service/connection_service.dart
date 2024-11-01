import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionNetWorkService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? subscription;
  init(void Function(ConnectivityResult)? listen) {
    _connectivity.onConnectivityChanged.listen(listen);
  }

  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }
}
