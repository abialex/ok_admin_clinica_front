import 'dart:async';
import 'dart:developer';
import 'package:admin_clinica_front/app/common/service/firebase_service.dart';
import 'package:admin_clinica_front/app/config/environments/env_dot_config.dart';
import 'package:admin_clinica_front/app/config/notification_local.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:upgrader/upgrader.dart';
import 'package:window_size/window_size.dart';
import 'app/config/app_dependecy_injection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
    if (TargetPlatform.android == defaultTargetPlatform) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }
  };
  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Upgrader.clearSavedSettings();
      await EnvDotConfig.initialize();

      setupLocator();
      if (TargetPlatform.android == defaultTargetPlatform) {
        await FlutterNotificationLocal.init();
        await FirebaseService.init();
      }

      if (TargetPlatform.windows == defaultTargetPlatform || TargetPlatform.macOS == defaultTargetPlatform || TargetPlatform.linux == defaultTargetPlatform) {
        setWindowMinSize(const Size(500, 360));
        setWindowMaxSize(Size.infinite);
      }

      runApp(await builder());
    },
    (error, stack) {
      log(error.toString(), stackTrace: stack);
      if (TargetPlatform.android == defaultTargetPlatform) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
    },
  );
}
