import 'dart:async';
import 'dart:developer';

import 'package:admin_clinica_front/app/config/environments/env_dot_config.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:upgrader/upgrader.dart';
import 'package:window_size/window_size.dart';
import 'app/config/app_dependecy_injection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

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
  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Upgrader.clearSavedSettings(); // REMOVE this for release builds

      await EnvDotConfig.initialize();
      setupLocator();

      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      if (TargetPlatform.windows == defaultTargetPlatform || TargetPlatform.macOS == defaultTargetPlatform || TargetPlatform.linux == defaultTargetPlatform) {
        //setWindowTitle('WS');
        setWindowMinSize(const Size(500, 360));
        setWindowMaxSize(Size.infinite);
      }
      // Initialize Firebase.

      runApp(await builder());
    },
    (error, stack) {
      log(error.toString(), stackTrace: stack);
      FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}
