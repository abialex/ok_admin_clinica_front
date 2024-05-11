import 'package:admin_clinica_front/data/datasources/remote/cita_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/ubicacion_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/usuario_api.dart';
import 'package:admin_clinica_front/data/repositories_impl/local_shared_repository_impl.dart';
import 'package:admin_clinica_front/data/repositories_impl/ubicacion_repository_impl.dart';
import 'package:admin_clinica_front/dominio/repositories/iubicacion_repository.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/dominio/services/ubicacion_service.dart';
import 'package:admin_clinica_front/dominio/services/usuario_service.dart';
import 'package:admin_clinica_front/infraestructura/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/local/flutter_storage_local.dart';
import '../../data/datasources/local/shared_preferences_local.dart';
import '../../data/datasources/remote/asistente_api.dart';
import '../../data/datasources/remote/doctor_api.dart';
import '../../data/repositories_impl/asistente_repository_impl.dart';
import '../../data/repositories_impl/cita_repository_impl.dart';
import '../../data/repositories_impl/doctor_repository_impl.dart';
import '../../data/repositories_impl/local_storage_repository_impl.dart';
import '../../data/repositories_impl/usuario_repository_impl.dart';
import '../../dominio/repositories/iasistente_repository.dart';
import '../../dominio/repositories/icita_repository.dart';
import '../../dominio/repositories/idoctor_repository.dart';
import '../../dominio/repositories/ilocal_repository.dart';
import '../../dominio/repositories/iusuario_repository.dart';
import '../../dominio/services/doctor_service.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../../dominio/services/local_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  locator.registerLazySingleton<Dio>(() => ApiClient().createDioLocal());

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
}

void setupServices() {
  locator.registerLazySingleton<CitasService>(() => CitasService(locator()));
  locator.registerLazySingleton<DoctorService>(() => DoctorService(locator()));
  locator.registerLazySingleton<UsuarioService>(() => UsuarioService(locator()));
  locator.registerLazySingleton<LocalService>(() => LocalService(locator()));
  locator.registerLazySingleton<UbicacionService>(() => UbicacionService(locator()));
}

void setupDataSource() {
  locator.registerLazySingleton<FlutterStorageLocal>(() => FlutterStorageLocal());
  locator.registerLazySingleton<SharedPreferencesLocal>(() => SharedPreferencesLocal());
  locator.registerLazySingleton<UsuarioApi>(() => UsuarioApi(locator()));
  locator.registerLazySingleton<CitaApi>(() => CitaApi(locator()));
  locator.registerLazySingleton<DoctorApi>(() => DoctorApi(locator()));
  locator.registerLazySingleton<AsistenteApi>(() => AsistenteApi(locator()));
  locator.registerLazySingleton<UbicacionApi>(() => UbicacionApi(locator()));
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
