import 'package:flutter/material.dart';

import '../global_widget/custom_navbar_navigation/design_nav_bar_navigation.dart';
import 'router.dart';

interface class ModulesRouter {
  final List<RutasNav> modulesList;
  final String modulesName;
  final String? modulesTipo;

  ModulesRouter({
    required this.modulesList,
    required this.modulesName,
    this.modulesTipo,
  });
}

List<ModulesRouter> modulesRouterList = [
  ModulesRouter(
    modulesName: "ASISTENTE",
    modulesTipo: "Asistente",
    modulesList: [
      RutasNav(
        icon: Icons.personal_injury_outlined,
        titulo: "Doctores",
        routePage: Routes.base_asistenteAsistente + Routes.doctor_list,
      ),
      RutasNav(
        icon: Icons.home,
        titulo: "Home",
        routePage: Routes.home,
      ),
      RutasNav(
        icon: Icons.message,
        titulo: "Citas",
        routePage: Routes.cita_list,
      ),
    ],
  ),
  ModulesRouter(
    modulesName: "ASISTENTE",
    modulesTipo: "Recepcion",
    modulesList: [
      RutasNav(
        icon: Icons.person_3_rounded,
        titulo: "Doctor",
        routePage: Routes.base_asistenteRecepcion + Routes.doctor_list,
      ),
      RutasNav(
        icon: Icons.personal_injury_outlined,
        titulo: "Pacientes",
        routePage: Routes.base_asistenteRecepcion + Routes.paciente_list,
      ),
      RutasNav(
        icon: Icons.home,
        titulo: "Home",
        routePage: Routes.home,
      ),
      RutasNav(
        icon: Icons.notifications_active,
        titulo: "Citas",
        routePage: Routes.base_asistenteRecepcion + Routes.cita_list,
      ),
      RutasNav(
        icon: Icons.bookmark_outline_sharp,
        titulo: "Otros",
        routePage: Routes.base_asistenteRecepcion + Routes.otros,
      ),
    ],
  ),
  ModulesRouter(
    modulesName: "ADMINISTRADOR",
    modulesList: [
      RutasNav(
        icon: Icons.personal_injury_outlined,
        titulo: "Doctores",
        routePage: Routes.base_admin + Routes.doctor_list,
      ),
      RutasNav(
        icon: Icons.home,
        titulo: "Home",
        routePage: Routes.home,
      ),
      RutasNav(
        icon: Icons.message,
        titulo: "Citas",
        routePage: Routes.citaDetails,
      ),
    ],
  ),
  ModulesRouter(
    modulesName: "DOCTOR",
    modulesList: [
      RutasNav(
        icon: Icons.personal_injury_outlined,
        titulo: "Doctor",
        routePage: Routes.base_admin + Routes.doctor_list,
      ),
      RutasNav(
        icon: Icons.home,
        titulo: "Home",
        routePage: Routes.home,
      ),
      RutasNav(
        icon: Icons.message,
        titulo: "Citas",
        routePage: Routes.citaDetails,
      ),
    ],
  )
];
