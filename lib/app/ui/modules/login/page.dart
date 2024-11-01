import 'dart:io';
import 'package:admin_clinica_front/app/common/blocs/firebase/firebase_notification_bloc.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_dto.dart';
import 'package:admin_clinica_front/app/config/routes/app_routes.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_details_release_widget.dart';
import 'package:admin_clinica_front/app/common/widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/loader/app_loader_text_jump_animated.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/loader/app_loader_text_writting_animated.dart';
import 'package:admin_clinica_front/app/ui/modules/login/bloc/login_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/login/widget/preview_slg.dart';
import 'package:admin_clinica_front/app/ui/modules/login/widget/text_form_field_box.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget mensajeWidget = AppTextGlobal.labelLightText(text: '');
  bool showPreview = false;
  // final UsuarioRepository _userRepository = UsuarioRepository(locator());
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(const LoginEvent.authenticated());
  }

  loadModules(UserLoginDTO usuario) {
    //buscando los modulos asignados a este usuario
    final router = modulesRouterList.where((e) => e.modulesName == usuario.rol && e.modulesTipo == usuario.tipo).firstOrNull;
    //buscando el index del Home
    final indexHome = router?.modulesList.indexWhere((element) => element.routePage == Routes.home);
    if (indexHome == -1) context.read<DialogMessageCubit>().showCustomAlert(titulo: "Módulo faltante", texto: "La aplicación ha iniciado sin el módulo Home");
    context.read<NavigatorCubit>().setupModules(router?.modulesList);
    context.read<NavigatorCubit>().updateIndexDelay(indexHome ?? -1);
  }

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = context.read<UsuarioBloc>();
    final firebaseBloc = context.read<FirebaseNotificationBloc>();
    final dialogMessageCubit = context.read<DialogMessageCubit>();
    final formKey = GlobalKey<FormState>(); // Clave global para el formulario

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.map(
          initial: (value) {
            setState(() {
              mensajeWidget = AppTextGlobal.labelLightText(text: 'initial');
            });
          },
          loading: (value) {
            setState(() {
              mensajeWidget = AppLoaderTextWritingAnimate(
                  message: "Verificando...",
                  buildText: (value) {
                    return AppTextGlobal.labelLightText(
                      text: value,
                      textAlign: TextAlign.left,
                    );
                  });
            });
          },
          usuarioAuthenticated: (value) async {
            loadModules(value.usuario);
            setState(() {
              showPreview = true;
            });
            if (Platform.isAndroid) {
              String ubicacionId = value.usuario.ubicaciones.isNotEmpty ? value.usuario.ubicaciones.first.toString() : '';
              firebaseBloc.add(const FirebaseNotificationEvent.getToken());
              firebaseBloc.add(FirebaseNotificationEvent.suscriptionGroup(value.usuario.rol + ubicacionId));
              firebaseBloc.add(FirebaseNotificationEvent.suscriptionFirstPlane(
                (notification) {
                  dialogMessageCubit.showCustomAlert(titulo: notification.notification?.title ?? 'n.a', texto: notification.notification?.body ?? 'n.a');
                },
              ));

              firebaseBloc.add(FirebaseNotificationEvent.suscriptionSecondPlane(
                (p0) async {},
              ));
            }
          },
          usuarioLoaded: (value) async {
            loadModules(value.usuario);
            await usuarioBloc.setUsuario(value.usuario);
            if (Platform.isAndroid) {
              String ubicacionId = value.usuario.ubicaciones.isNotEmpty ? value.usuario.ubicaciones.first.toString() : '';

              firebaseBloc.add(const FirebaseNotificationEvent.getToken());
              firebaseBloc.add(FirebaseNotificationEvent.suscriptionGroup(value.usuario.rol + ubicacionId));
              firebaseBloc.add(FirebaseNotificationEvent.suscriptionFirstPlane(
                (notification) {
                  dialogMessageCubit.showCustomAlert(titulo: notification.notification?.title ?? 'n.a', texto: notification.notification?.body ?? 'n.a');
                },
              ));
              firebaseBloc.add(FirebaseNotificationEvent.suscriptionSecondPlane(
                (p0) async {},
              ));
            }
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          authenticatedFailure: (value) {
            setState(() {
              mensajeWidget = AppTextGlobal.labelLightText(
                text: value.detalle,
              );
            });
          },
          failure: (value) {
            setState(() {
              mensajeWidget = AppTextGlobal.labelLightText(text: value.error, colorText: AppConstColors.red);
            });
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppConstColors.white,
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
                                color: AppConstColors.slgPrincipal,
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
                            color: AppConstColors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTextGlobal.labelLightText(
                                  text: "App de Control de Citas Dentales",
                                  textAlign: TextAlign.center,
                                  colorText: AppConstColors.grey,
                                  fontSize: 12,
                                ),
                                AppBox.h20,
                                AppTextFormFieldBox(
                                  hintText: "Nombre de usuario",
                                  controller: _usernameController,
                                  validator: Validators.validateNotEmpty,
                                ),
                                AppBox.h20,
                                AppTextFormFieldBox(
                                  isObscureText: true,
                                  hintText: "Contraseña",
                                  controller: _passwordController,
                                  validator: Validators.validateNotEmpty,
                                ),
                              ],
                            ),
                          ),
                          AppBox.h32,
                          AppBox.h6,
                          ButtonSuccess(
                            text: "Ingresar",
                            onClick: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(LoginEvent.loginUsuario(_usernameController.text, _passwordController.text));
                              }
                            },
                          ),
                          AppBox.h10,
                          Center(child: mensajeWidget),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              final Uri uri = Uri.parse('https://sites.google.com/view/politica-de-privacidad-slg-app/inicio');

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {}
                            }, // Acción al tocar el texto
                            child: const Text(
                              'Política de privacidad',
                              style: TextStyle(
                                color: AppConstColors.grey, // Color gris del texto
                                decoration: TextDecoration.underline, // Subrayado
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          AppBox.h24,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                AppConstSvgs.icon_fb,
                                height: 12,
                              ),
                              AppBox.w4,
                              AppTextGlobal.labelSmallText(text: "/COEsanluisgeminis", colorText: AppConstColors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppBox.h10,
                    const AppDetailsReleaseWidget(),
                    AppBox.h2,
                  ],
                ),
              ),
              Visibility(visible: showPreview, child: const PreviewSLG())
            ],
          ),
        ),
      ),
    );
  }
}
