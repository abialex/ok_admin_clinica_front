// ignore_for_file: constant_identifier_names

import 'package:admin_clinica_front/ui/modules/atencion/page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_asistente_asistente/pages/cita_list_page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor/pages/cita_list_doctor_page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_asistente_recepcion/pages/cita_update_page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor_administrador/pages/cita_add_page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor_administrador/pages/cita_list_page.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor_administrador/pages/cita_update_page.dart';
import 'package:admin_clinica_front/ui/modules/doctor/doctor_list/doctor_list_adm_page.dart';
import 'package:admin_clinica_front/ui/modules/login/page.dart';
import 'package:admin_clinica_front/ui/modules/otros/page.dart';
import 'package:admin_clinica_front/ui/modules/paciente/paciente_list/paciente_list_asist_recep_page.dart';
import 'package:flutter/material.dart';

import '../modules/cita/r_asistente_recepcion/pages/cita_add_page.dart';
import '../modules/cita/r_asistente_recepcion/pages/cita_list_page.dart';
import '../modules/doctor/doctor_add/doctor_add_asist_recep_page.dart';
import '../modules/doctor/doctor_list/doctor_list_asist_recep_page.dart';
import '../modules/doctor/doctor_list/doctor_list_asist_asist_page.dart';
import '../modules/doctor/doctor_update/doctor_update_asist_recep_page.dart';
import '../modules/home/page.dart';

class Routes {
  static const String base_admin = "/admin";
  static const String base_asistenteAsistente = "/asistente_asistente";
  static const String base_asistenteRecepcion = "/asistente_recepcion";
  static const String base_doctor = "/doctor";
  static const String base_doctor_admin = "/doctor_admin";

  static const String home = '/home';
  static const String doctor_list = '/doctor_list';
  static const String doctor_add = '/doctor_add';
  static const String doctor_update = '/doctor_update';

  static const String cita_list = '/cita_list';
  static const String cita_add = '/cita_add';
  static const String cita_update = '/cita_update';
  static const String citaDetails = '/products/details';

  static const String paciente_list = '/paciente_list';

  static const String otros = '/otros';
  static const String atencion = '/atencion';

  static const String login = '/';
}
//doctor administrador
//doctor asistente
//doctor

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uri = Uri.parse(settings.name ?? "");
    switch (uri.path) {
      case Routes.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginPage(),
          // transitionsBuilder: _createTransition,
        );
      case Routes.home:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
          // transitionsBuilder: _createTransition,
        );
      case Routes.base_doctor + Routes.atencion:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => AtencionPage(),
          // transitionsBuilder: _createTransition,
        );
      // return MaterialPageRoute(builder: (_) => const CitaPage());
      //? Asistente-recepcion
      case Routes.base_asistenteRecepcion + Routes.cita_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaListAsistenteRecepcionPage(),
          //  transitionsBuilder: _createScaleTransition,
        );

      // return MaterialPageRoute(builder: (_) => const CitaListPage());
      case Routes.base_asistenteRecepcion + Routes.cita_add:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaAddPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_asistenteRecepcion + Routes.cita_update:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaUpdateAsistenteRecepcionPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );

      case Routes.doctor_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DoctorListAdminPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_asistenteRecepcion + Routes.doctor_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DoctorListAsistenteRecepcionPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_asistenteAsistente + Routes.doctor_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DoctorListAsistenteAsistentePage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );

      case Routes.base_asistenteRecepcion + Routes.doctor_add:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DoctorAddAsistenteRecepcionPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_asistenteRecepcion + Routes.doctor_update:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DoctorUpdateAsistenteRecepcionPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );

      case Routes.base_asistenteRecepcion + Routes.paciente_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const PacienteListAsistenteRecepcionPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );

      case Routes.base_asistenteRecepcion + Routes.otros:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OtrosPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      //? Asistente-asistente
      case Routes.base_asistenteAsistente + Routes.cita_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaListAsistenteAsistentePage(),
          //  transitionsBuilder: _createScaleTransition,
        );
      //? Doctor-doctor
      case Routes.base_doctor + Routes.cita_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaListDoctorPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );

      //? Doctor-administrador
      case Routes.base_doctor_admin + Routes.cita_list:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaListDoctorAdministradorPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_doctor_admin + Routes.cita_add:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaAddDoctorAdminPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      case Routes.base_doctor_admin + Routes.cita_update:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => CitaUpdateDoctorAdminPage(),
          //   transitionsBuilder: _createSlideFadeTransition,
        );
      //? Administrador

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }

  static Widget _createTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0), // Empieza desde abajo
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Widget _createScaleTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );
  }

  static Widget _createRotateScaleTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.linear),
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        ),
        child: child,
      ),
    );
  }

  static Widget _createSlideFadeTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // Comienza desde la derecha
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404 Not Found"),
        automaticallyImplyLeading: false, // No muestra el botón de regreso
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              "Oops! Page not found.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "The page you are looking for does not exist.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // !falta validar para que se redirija al home
                // final navbarCubit = context.read<NavigatorCubit>();
                // navbarCubit.updateIndexDelay(1);
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
