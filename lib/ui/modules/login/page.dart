import 'package:admin_clinica_front/core/constants/app_const_name.dart';
import 'package:admin_clinica_front/core/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/core/router.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/loader/app_loader_imag.dart';
import 'package:admin_clinica_front/ui/global_widget/loader/app_loader_text_jump_animated.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/loader/app_loader_text_writting_animated.dart';
import 'package:admin_clinica_front/ui/modules/login/bloc/login_bloc.dart';
import 'package:admin_clinica_front/ui/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
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
    final formKey = GlobalKey<FormState>(); // Clave global para el formulario

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ShowLoaderImagenCubit()),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.white,
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppBox.h60,
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppConstSvgs.logo_string,
                                    height: 55,
                                  ),
                                  AppBox.w12,
                                  SvgPicture.asset(
                                    AppConstSvgs.logo,
                                    color: AppColors.slgPrincipal,
                                    height: 65,
                                  )
                                      .animate(
                                        onPlay: (controller) => controller.loop(),
                                      )
                                      .rotate(
                                        duration: 1.25.seconds,
                                        delay: 7.5.seconds,
                                      ),
                                ],
                              ),
                              AppBox.h28,
                              AppLoaderTextJumpAnimate(
                                message: "Bienvenido a SLG!",
                                heightJump: 5,
                                buildText: (value) {
                                  return AppTextGlobal.labelMediumText(
                                    text: value,
                                    textAlign: TextAlign.left,
                                  );
                                },
                              ),
                              AppBox.h10,
                              Container(
                                color: AppColors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppTextGlobal.labelLightText(
                                      text: "Login",
                                      textAlign: TextAlign.left,
                                      colorText: AppColors.grey,
                                      fontSize: 20,
                                    ),
                                    AppBox.h20,
                                    AppTextFormFieldBox(
                                      hintText: "Username",
                                      controller: _usernameController,
                                      validator: Validators.validateNotEmpty,
                                    ),
                                    AppBox.h20,
                                    AppTextFormFieldBox(
                                      isObscureText: true,
                                      hintText: "Password",
                                      controller: _passwordController,
                                      validator: Validators.validateNotEmpty,
                                    ),
                                  ],
                                ),
                              ),
                              AppBox.h32,
                              AppTextGlobal.labelSmallText(
                                text: "",
                                textAlign: TextAlign.right,
                                colorText: AppColors.grey,
                                fontSize: 12,
                              ),
                              AppBox.h6,
                              state.map(
                                initial: (state) {
                                  return ButtonSuccess(
                                    text: "Sign In",
                                    onClick: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                                        context.read<ShowLoaderImagenCubit>().show();
                                      }
                                    },
                                  );
                                },
                                loading: (state) {
                                  // loaderCubit.show();
                                  return ButtonSuccess(
                                    text: "Cargando...",
                                    onClick: () {},
                                  );
                                },
                                usuarioLoaded: (state) {
                                  // loaderCubit.hidden();
                                  // final router = modulesRouterList.where((e) => e.modulesName == state.usuario.rol && e.modulesTipo == state.usuario.tipo).firstOrNull;
                                  // final indexHome = router?.modulesList.indexWhere((element) => element.routePage == Routes.home);
                                  // if (indexHome == -1) dialogCubit.showCustomAlert(titulo: "Módulo faltante", texto: "La aplicación ha iniciado sin el módulo Home");
                                  // context.read<NavigatorCubit>().setupModules(router?.modulesList);
                                  // context.read<NavigatorCubit>().updateIndexDelay(indexHome ?? -1);
                                  // usuarioBloc.setUsuario(state.usuario);
                                  // WidgetsBinding.instance.addPostFrameCallback((_) async {
                                  //   await Future.delayed(2.seconds);
                                  //   Navigator.pushReplacementNamed(context, Routes.home);
                                  // });
                                  // return ButtonSuccess(
                                  //   text: "Sign In",
                                  //   onClick: () {
                                  //     _usernameController.text = "slg_test";
                                  //     _passwordController.text = "test01ss02";
                                  //     context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                                  //     context.read<ShowLoaderImagenCubit>().show();
                                  //   },
                                  // );
                                  return const SizedBox.shrink();
                                },
                                failure: (state) {
                                  context.read<ShowLoaderImagenCubit>().hidden();
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ButtonSuccess(
                                        text: "Reintentar",
                                        onClick: () {
                                          if (formKey.currentState!.validate()) {
                                            context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                                            context.read<ShowLoaderImagenCubit>().show();
                                          }
                                        },
                                      ),
                                      Positioned(
                                        right: 0,
                                        left: 0,
                                        bottom: -30,
                                        child: AppTextGlobal.errorlightText(
                                          text: state.error,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              AppBox.h20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    AppConstSvgs.icon_fb,
                                    height: 12,
                                  ),
                                  AppBox.w4,
                                  AppTextGlobal.labelSmallText(text: "/COEsanluisgeminis", colorText: AppColors.grey),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppBox.h10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTextGlobal.labelSmallText(
                              text:
                                  "${dotenv.env[AppConstName.app_name] ?? '- -'} v${dotenv.env[AppConstName.version] ?? '- -'} ${dotenv.env[AppConstName.last_update_date] ?? '- -'} - ${dotenv.env[AppConstName.enviroment] ?? '- -'}",
                              colorText: AppColors.grey,
                              textAlign: TextAlign.left,
                              fontSize: 7,
                            ),
                          ],
                        ),
                        AppBox.h2,
                      ],
                    ),
                  ),
                  BlocBuilder<ShowLoaderImagenCubit, bool>(
                    builder: (context, show) {
                      return AnimatedSwitcher(
                        duration: 0.75.seconds,
                        child: show
                            ? Container(
                                alignment: Alignment.center,
                                color: AppColors.white.withOpacity(0.97),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 400,
                                      child: CarruselImag(),
                                    ),
                                    AppBox.h20,
                                    AnimatedSwitcher(
                                      duration: 0.5.seconds,
                                      child: state.map(
                                        initial: (state) {
                                          return const SizedBox.shrink();
                                        },
                                        loading: (state) {
                                          return Column(
                                            children: [
                                              AppLoaderTextWritingAnimate(
                                                message: "Verificando",
                                                buildText: (value) {
                                                  return AppTextGlobal.labelMediumText(text: value);
                                                },
                                              ),
                                              AppBox.h20,
                                              const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                            ],
                                          );
                                        },
                                        usuarioLoaded: (state) {
                                          final router = modulesRouterList.where((e) => e.modulesName == state.usuario.rol && e.modulesTipo == state.usuario.tipo).firstOrNull;
                                          final indexHome = router?.modulesList.indexWhere((element) => element.routePage == Routes.home);
                                          if (indexHome == -1) dialogCubit.showCustomAlert(titulo: "Módulo faltante", texto: "La aplicación ha iniciado sin el módulo Home");
                                          context.read<NavigatorCubit>().setupModules(router?.modulesList);
                                          context.read<NavigatorCubit>().updateIndexDelay(indexHome ?? -1);
                                          usuarioBloc.setUsuario(state.usuario);
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 50),
                                            child: Column(
                                              children: [
                                                AppLoaderTextJumpAnimate(
                                                  message: "Bienvenido",
                                                  heightJump: 2.5,
                                                  buildText: (value) {
                                                    return AppTextGlobal.labelMediumText(text: value);
                                                  },
                                                ),
                                                AppBox.h20,
                                                ButtonSuccess(
                                                  text: "Ingresar",
                                                  onClick: () {
                                                    Navigator.pushReplacementNamed(context, Routes.home);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        failure: (state) {
                                          return const SizedBox.shrink();
                                        },
                                      ),
                                    ),
                                    AppBox.h20,
                                  ],
                                ),
                              )
                            : SizedBox.shrink(
                                key: UniqueKey(),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppTextFormFieldBox extends StatelessWidget {
  const AppTextFormFieldBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.isObscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.dark,
      controller: controller,
      obscureText: isObscureText,
      style: const TextStyle(color: AppColors.dark),
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        isCollapsed: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        hintStyle: const TextStyle(
          fontSize: 15,
          color: AppColors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.dark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.darkAppBar,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.redSunat,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.darkAppBar,
          ),
        ),
      ),
      expands: false,
    );
  }
}

class ShowLoaderImagenCubit extends Cubit<bool> {
  ShowLoaderImagenCubit() : super(false);

  void show() {
    emit(true);
  }

  void hidden() {
    emit(false);
  }
}
