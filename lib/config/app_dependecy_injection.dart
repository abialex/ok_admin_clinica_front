import 'package:admin_clinica_front/config/app_flavor_config.dart';
import 'package:admin_clinica_front/config/interceptor/inteceptor.dart';
import 'package:admin_clinica_front/data/datasources/remote/cita_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/sunat_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/ubicacion_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/usuario_api.dart';
import 'package:admin_clinica_front/data/repositories_impl/doctor_contenedor_impl/doctor_contenedor_repository.dart';
import 'package:admin_clinica_front/data/repositories_impl/local_shared_repository_impl.dart';
import 'package:admin_clinica_front/data/repositories_impl/services_repository.dart';
import 'package:admin_clinica_front/data/repositories_impl/ubicacion_contenedor_impl/ubicacion_contenedor_repository.dart';
import 'package:admin_clinica_front/data/repositories_impl/ubicacion_repository_impl.dart';
import 'package:admin_clinica_front/dominio/repositories/idoctor_contenedor/idoctor_contenedor_repository.dart';
import 'package:admin_clinica_front/dominio/repositories/idubicacion_contenedor/iubicacion_contenedor_repository.dart';
import 'package:admin_clinica_front/dominio/repositories/iservices_repository.dart';
import 'package:admin_clinica_front/dominio/repositories/iubicacion_repository.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/dominio/services/cmd_services.dart';
import 'package:admin_clinica_front/dominio/services/excel_service.dart';
import 'package:admin_clinica_front/dominio/services/services_service.dart';
import 'package:admin_clinica_front/dominio/services/ubicacion_service.dart';
import 'package:admin_clinica_front/dominio/services/usuario_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../data/datasources/local/flutter_storage_local.dart';
import '../data/datasources/local/shared_preferences_local.dart';
import '../data/datasources/remote/asistente_api.dart';
import '../data/datasources/remote/doctor_api.dart';
import '../data/repositories_impl/asistente_repository_impl.dart';
import '../data/repositories_impl/cita_repository_impl.dart';
import '../data/repositories_impl/doctor_repository_impl.dart';
import '../data/repositories_impl/local_storage_repository_impl.dart';
import '../data/repositories_impl/usuario_repository_impl.dart';
import '../dominio/repositories/iasistente_repository.dart';
import '../dominio/repositories/icita_repository.dart';
import '../dominio/repositories/idoctor_repository.dart';
import '../dominio/repositories/ilocal_repository.dart';
import '../dominio/repositories/iusuario_repository.dart';
import '../dominio/services/doctor_service.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../dominio/services/local_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
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
}

void setupDataSource() {
  locator.registerLazySingleton<FlutterStorageLocal>(() => FlutterStorageLocal(locator()));
  locator.registerLazySingleton<SharedPreferencesLocal>(() => SharedPreferencesLocal(locator()));
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
