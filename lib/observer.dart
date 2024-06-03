import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:window_size/window_size.dart';
// import 'package:wsapp/app/config/app_dependecy_injection.dart';
// import 'package:wsapp/app/config/app_store_provider.dart';

import 'core/di/injections.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await setupLocator();
  if (TargetPlatform.windows == defaultTargetPlatform || TargetPlatform.macOS == defaultTargetPlatform || TargetPlatform.linux == defaultTargetPlatform) {
    //setWindowTitle('WS');
    setWindowMinSize(const Size(550, 550));
    setWindowMaxSize(Size.infinite);
  }
  //await Firebase.initializeApp(options: options);
  // await AppStoreProvider.instance.initializeStore();

  // Add cross-flavor configuration here

  runApp(await builder());
}
