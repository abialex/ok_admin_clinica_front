import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_create_bloc.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/ui/modules/home/bloc/home_bloc.dart';
import 'package:admin_clinica_front/ui/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/usuario_session/bloc/usuario_bloc.dart';
import 'global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'app.dart';
import 'modules/cita/bloc/cita_bloc.dart';

// ignore_for_file: lines_longer_than_80_chars

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DialogMessageCubit()),
        BlocProvider(create: (_) => NavigatorCubit()),
        //bloc
        BlocProvider(create: (context) => DoctorListBloc()),

        BlocProvider(create: (context) => DoctorCreateBloc()),
        BlocProvider(create: (context) => CitaBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => UsuarioBloc()),
        BlocProvider(create: (context) => UbicacionBloc()),
      ],
      child: const SafeArea(
        child: App(),
      ),
    );
  }
}

// void main() async {
//   await setupLocator();
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => DialogMessageCubit(),
//         ),
//         BlocProvider(
//           create: (_) => NavbarCubit(),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
