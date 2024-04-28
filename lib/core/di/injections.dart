import 'package:admin_clinica_front/data/datasources/remote/cita_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/usuario_api.dart';
import 'package:admin_clinica_front/infraestructura/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/local/auth_service.dart';
import '../../data/datasources/remote/asistente_api.dart';
import '../../data/datasources/remote/doctor_api.dart';
import '../../data/repositories_impl/usuario_repository_impl.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  setupServices();
  setupDataSource();
  setupRepositorys();
  setupBlocs();
}

void setupRepositorys() {
  locator.registerLazySingleton<UsuarioRepository>(() => UsuarioRepository());
}

void setupServices() {
  locator.registerLazySingleton<Dio>(() => ApiClient().createDioLocal());
  locator.registerSingleton<AuthService>(AuthService(locator()));
}

void setupDataSource() {
  locator.registerSingleton<UsuarioApi>(UsuarioApi(locator()));
  locator.registerSingleton<CitaApi>(CitaApi(locator()));
  locator.registerSingleton<DoctorApi>(DoctorApi(locator()));
  locator.registerSingleton<AsistenteApi>(AsistenteApi(locator()));
}

void setupBlocs() {
  // locator.registerFactory(
//     () => MyBloc(
//       locator<AlumnoRepository>(),
//       locator<ProfesorRepository>(),
//     ),
//   );
}
