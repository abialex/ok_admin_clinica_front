import 'package:admin_clinica_front/app/common/repository/firebase/firebase_repository_impl.dart';
import 'package:admin_clinica_front/app/common/repository/firebase/i_firebase_repository.dart';
import 'package:admin_clinica_front/app/common/repository/notification/inotification_repository.dart';
import 'package:admin_clinica_front/app/common/repository/notification/notification_repository_impl.dart';
import 'package:admin_clinica_front/app/common/service/connection_service.dart';
import 'package:admin_clinica_front/app/common/service/firebase_service.dart';
import 'package:admin_clinica_front/app/common/service/notification_service.dart';
import 'package:admin_clinica_front/app/config/app_flavor_config.dart';
import 'package:admin_clinica_front/app/config/interceptor/inteceptor.dart';
import 'package:admin_clinica_front/app/common/service/cita_api.dart';
import 'package:admin_clinica_front/app/common/service/sunat_api.dart';
import 'package:admin_clinica_front/app/common/service/ubicacion_api.dart';
import 'package:admin_clinica_front/app/common/service/usuario_api.dart';
import 'package:admin_clinica_front/app/common/repository/contenedores/doctor_contenedor_impl/doctor_contenedor_repository.dart';
import 'package:admin_clinica_front/app/data/repository/storage/local_shared_repository_impl.dart';
import 'package:admin_clinica_front/app/common/repository/services_external/services_repository.dart';
import 'package:admin_clinica_front/app/common/repository/contenedores/ubicacion_contenedor_impl/ubicacion_contenedor_repository.dart';
import 'package:admin_clinica_front/app/common/repository/ubicacion/ubicacion_repository_impl.dart';
import 'package:admin_clinica_front/app/common/repository/contenedores/doctor_contenedor_impl/idoctor_contenedor_repository.dart';
import 'package:admin_clinica_front/app/common/repository/contenedores/ubicacion_contenedor_impl/iubicacion_contenedor_repository.dart';
import 'package:admin_clinica_front/app/common/repository/services_external/iservices_repository.dart';
import 'package:admin_clinica_front/app/common/repository/ubicacion/iubicacion_repository.dart';
import 'package:admin_clinica_front/app/common/mappers/citas_service.dart';
import 'package:admin_clinica_front/app/common/mappers/cmd_services.dart';
import 'package:admin_clinica_front/app/common/mappers/excel_service.dart';
import 'package:admin_clinica_front/app/common/mappers/services_service.dart';
import 'package:admin_clinica_front/app/common/mappers/ubicacion_service.dart';
import 'package:admin_clinica_front/app/common/mappers/usuario_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../data/services/flutter_storage_service.dart';
import '../data/services/shared_preferences_service.dart';
import '../common/service/asistente_api.dart';
import '../common/service/doctor_api.dart';
import '../common/repository/asistente/asistente_repository_impl.dart';
import '../common/repository/cita/cita_repository_impl.dart';
import '../common/repository/doctor/doctor_repository_impl.dart';
import '../data/repository/storage/local_storage_repository_impl.dart';
import '../common/repository/usuario/usuario_repository_impl.dart';
import '../common/repository/asistente/i_asistente_repository.dart';
import '../common/repository/cita/i_cita_repository.dart';
import '../common/repository/doctor/i_doctor_repository.dart';
import '../data/repository/storage/ilocal_repository.dart';
import '../common/repository/usuario/iusuario_repository.dart';
import '../common/mappers/doctor_service.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../common/mappers/local_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  var dio = Dio();
  dio.options.baseUrl = AppFlavorConfig.urlApp;
  dio.interceptors.add(AppInterceptor());
  dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
  dio.interceptors.add(LogInterceptor(responseBody: true)); //para visualizar
  if (kDebugMode) {
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );
  }
  locator.registerLazySingleton(() => dio);
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  locator.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());

  setupDataSource();
  setupRepositorys();
  setupServices();
  setupBlocs();
}

void setupRepositorys() {
  //SI ES CEL O DESKPTOP
  if (foundation.defaultTargetPlatform == foundation.TargetPlatform.android || foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS) {
    locator.registerLazySingleton<ILocalRepository>(() => FlutterStorageRepository(locator()));
  } else {
    locator.registerLazySingleton<ILocalRepository>(() => SharedPreferencesRepository(locator()));
  }

  locator.registerLazySingleton<IUsuarioRepository>(() => UsuarioRepository(locator()));
  locator.registerLazySingleton<ICitaRepository>(() => CitaRepository(locator()));
  locator.registerLazySingleton<IDoctorRepository>(() => DoctorRepository(locator()));
  locator.registerLazySingleton<IAsistenteRepository>(() => AsistenteRepository(locator()));
  locator.registerLazySingleton<IUbicacionRepository>(() => UbicacionRepository(locator()));
  locator.registerLazySingleton<IServicesRepository>(() => ServicesRepository(locator()));
  locator.registerLazySingleton<IDoctorContenedorLocalRepository>(() => DoctorContenedorLocalRepository(locator()));
  locator.registerLazySingleton<IUbicacionContenedorLocalRepository>(() => UbicacionContenedorLocalRepository(locator()));
  locator.registerLazySingleton<IFirebaseRepository>(FirebaseRepository.new);
  locator.registerLazySingleton<INotificationRepository>(NotificationRepository.new);
}

void setupServices() {
  locator.registerLazySingleton<CitasService>(() => CitasService(locator()));
  locator.registerLazySingleton<DoctorService>(() => DoctorService(locator()));
  locator.registerLazySingleton<UsuarioService>(() => UsuarioService(locator()));
  locator.registerLazySingleton<LocalService>(() => LocalService(locator()));
  locator.registerLazySingleton<UbicacionService>(() => UbicacionService(locator()));
  locator.registerLazySingleton<ServicesService>(() => ServicesService(locator()));
  locator.registerLazySingleton<ExcelService>(() => ExcelService());
  locator.registerLazySingleton<CMDservice>(() => CMDservice());
  locator.registerLazySingleton<FirebaseService>(FirebaseService.new);
  locator.registerLazySingleton<NotificationService>(NotificationService.new);
  locator.registerLazySingleton<ConnectionNetWorkService>(ConnectionNetWorkService.new);
}

void setupDataSource() {
  locator.registerLazySingleton<FlutterStorageService>(() => FlutterStorageService(locator()));
  locator.registerLazySingleton<SharedPreferencesService>(() => SharedPreferencesService(locator()));
  locator.registerLazySingleton<UsuarioApi>(() => UsuarioApi(locator()));
  locator.registerLazySingleton<CitaApi>(() => CitaApi(locator()));
  locator.registerLazySingleton<DoctorApi>(() => DoctorApi(locator()));
  locator.registerLazySingleton<AsistenteApi>(() => AsistenteApi(locator()));
  locator.registerLazySingleton<UbicacionApi>(() => UbicacionApi(locator()));
  locator.registerLazySingleton<SunatApi>(() => SunatApi(locator()));
}

void setupBlocs() {
  // locator.registerLazySingleton<CitaBloc>(() => CitaBloc());
  // locator.registerLazySingleton<DoctorBloc>(() => DoctorBloc(locator()));
  // locator.registerFactory(
//     () => MyBloc(
//       locator<AlumnoRepository>(),
//       locator<ProfesorRepository>(),
//     ),
//   );
}
