import 'package:admin_clinica_front/app/common/blocs/excel/excel_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/app_loader.dart';
import 'package:admin_clinica_front/app/common/cubits/theme_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/desk_dialog/cubit/desk_dialog_cubit.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_create_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_update_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/home/bloc/home_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/login/bloc/login_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'app.dart';
import 'ui/modules/cita/bloc/cita_bloc.dart';

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
        BlocProvider(create: (_) => DeskDialogCubit()),
        BlocProvider(create: (_) => NavigatorCubit()),
        BlocProvider(create: (_) => LoaderCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => ExcelCubit()),

        //bloc
        BlocProvider(create: (context) => DoctorListBloc()),
        BlocProvider(create: (context) => DoctorCreateBloc()),
        BlocProvider(create: (context) => DoctorUpdateBloc()),
        BlocProvider(create: (context) => CitaBloc()),
        BlocProvider(create: (context) => CitaUpdateBloc()),
        BlocProvider(create: (context) => CitaCreateBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => UsuarioBloc()),
        BlocProvider(create: (context) => UbicacionBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: const SafeArea(
        child: App(),
      ),
    );
  }
}
