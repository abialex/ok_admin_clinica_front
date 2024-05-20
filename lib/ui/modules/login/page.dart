import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/core/router.dart';
import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/modules/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final UsuarioRepository _userRepository = UsuarioRepository(locator());

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = context.read<UsuarioBloc>();
    final dialogCubit = context.read<DialogMessageCubit>();
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("SLG")),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  state.map(
                    initial: (state) {
                      return ElevatedButton(
                        onPressed: () async {
                          _usernameController.text = "slg_a_45";
                          _passwordController.text = "45643212";
                          context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                        },
                        child: const Text('Login'),
                      );
                    },
                    loading: (state) {
                      return const Text("cargando");
                    },
                    usuarioLoaded: (state) {
                      final router = modulesRouterList.where((e) => e.modulesName == state.usuario.rol && e.modulesTipo == state.usuario.tipo).firstOrNull;
                      final indexHome = router?.modulesList.indexWhere((element) => element.routePage == Routes.home);
                      if (indexHome == -1) dialogCubit.showCustomAlert(titulo: "Módulo faltante", texto: "La aplicación ha iniciado sin el módulo Home");
                      context.read<NavigatorCubit>().setupModules(router?.modulesList);
                      context.read<NavigatorCubit>().updateIndexDelay(indexHome ?? -1);
                      usuarioBloc.setUsuario(state.usuario);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Future.delayed(_);
                        Navigator.pushReplacementNamed(context, Routes.home);
                      });

                      return const Text("Bienvenido");
                    },
                    failure: (state) {
                      return Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              _usernameController.text = "slg_a_051";
                              _passwordController.text = "05195362";
                              context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                            },
                            child: const Text('Reintentar'),
                          ),
                          Text(state.error),
                        ],
                      );
                    },
                  )
                  // !state.loading ? Text(state.isSuccess ? "" : "no eres el papu") : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
