import 'package:admin_clinica_front/data/datasources/remote/cita_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/usuario_api.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/infraestructura/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/local/auth_service.dart';
import '../../data/datasources/remote/asistente_api.dart';
import '../../data/datasources/remote/doctor_api.dart';
import '../../data/repositories_impl/cita_repository_impl.dart';
import '../../data/repositories_impl/usuario_repository_impl.dart';
import '../../dominio/repositories/icita_repository.dart';
import '../../dominio/repositories/iusuario_repository.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  locator.registerLazySingleton<Dio>(() => ApiClient().createDioLocal());

  setupDataSource();
  setupRepositorys();
  setupServices();

  setupBlocs();
}

void setupRepositorys() {
  locator
      .registerLazySingleton<AuthRepository>(() => AuthRepository(locator()));
  locator.registerLazySingleton<IUsuarioRepository>(
      () => UsuarioRepository(locator()));
  locator
      .registerLazySingleton<ICitaRepository>(() => CitaRepository(locator()));
}

void setupServices() {
  locator.registerLazySingleton<CitasService>(() => CitasService(locator()));
}

void setupDataSource() {
  locator.registerLazySingleton<UsuarioApi>(() => UsuarioApi(locator()));
  locator.registerLazySingleton<CitaApi>(() => CitaApi(locator()));
  locator.registerLazySingleton<DoctorApi>(() => DoctorApi(locator()));
  locator.registerLazySingleton<AsistenteApi>(() => AsistenteApi(locator()));
}

void setupBlocs() {
  // locator.registerFactory(
//     () => MyBloc(
//       locator<AlumnoRepository>(),
//       locator<ProfesorRepository>(),
//     ),
//   );
}
