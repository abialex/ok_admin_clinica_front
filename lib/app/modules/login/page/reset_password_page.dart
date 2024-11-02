import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_responsive_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_01/app_input_text_form_field.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/modules/login/bloc/login_bloc.dart';
import 'package:admin_clinica_front/app/modules/login/model/update_password_request_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget with ResponsiveWidgetMixin {
  const ResetPasswordPage({super.key, required this.usuario});
  final UserResponseDataModel usuario;

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = context.read<UsuarioBloc>();
    final dialogMessageCubit = context.read<DialogMessageCubit>();

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.mapOrNull(
          failure: (value) {
            dialogMessageCubit.showErrorAlert(texto: value.error);
          },
          usuarioUpdatePasswordSuccess: (value) {
            usuarioBloc.setUsuario(usuario.copyWith(isNewPassword: false));
            dialogMessageCubit.showSuccessAlert(texto: value.response);
            Navigator.pushReplacementNamed(context, Routes.home);
          },
        );
      },
      child: whatIs(context),
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final dialogMessageCubit = context.read<DialogMessageCubit>();

    final formKey = GlobalKey<FormState>(); // Clave global para el formulario
    final password1Controller = TextEditingController();
    final password2Controller = TextEditingController();
    return PageBaseDesktop(
      title: 'ACTUALIZAR CONTRASEÑA',
      backgroundColor: AppConstColors.white,
      showMenu: false,
      bodyWidget: AppResponsiveDesktop(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstColors.slgPrincipal.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75), // Color de la sombra
                    spreadRadius: -2,
                    blurRadius: 5,
                    offset: const Offset(1.5, 1.5),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppInputTextFormField(
                      label: 'Nueva contraseña',
                      controller: password1Controller,
                      validator: (value) => Validators.validateWithMultiple(
                        [
                          Validators.validateNotEmpty,
                          (subValue) => Validators.validateMinLength(subValue, 8),
                        ],
                        value,
                      ),
                    ),
                    AppInputTextFormField(
                      label: 'Confirmar contraseña',
                      controller: password2Controller,
                      validator: (value) => Validators.validateWithMultiple(
                        [
                          Validators.validateNotEmpty,
                          (subValue) => Validators.validateMinLength(subValue, 8),
                        ],
                        value,
                      ),
                    ),
                    AppBox.h10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonSuccess(
                        text: 'Aceptar',
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            if (password1Controller.text != password2Controller.text) {
                              dialogMessageCubit.showErrorAlert(texto: 'Las contraseñas no coinciden');
                              return;
                            }
                            loginBloc.add(LoginEvent.updatePassword(UpdatePasswordRequestDataModel(password1: password1Controller.text, password2: password2Controller.text)));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppBox.h10,
            AppTextGlobal.labelMediumText(text: 'Recomendaciones:'),
            AppBox.h12,
            AppTextGlobal.lightText(text: '1. Longitud mínima de 8 caracteres.'),
            AppTextGlobal.lightText(text: '2. Incluir al menos una letra mayúscula, una minúscula, un número y un símbolo especial.', maxLines: 2),
            AppTextGlobal.lightText(text: '3. No reutilizar contraseñas usadas en otras cuentas.', maxLines: 2),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final dialogMessageCubit = context.read<DialogMessageCubit>();

    final formKey = GlobalKey<FormState>(); // Clave global para el formulario
    final password1Controller = TextEditingController();
    final password2Controller = TextEditingController();

    return PageBasePhone(
      showNavbar: false,
      headerWidget: const HeaderMobile(
        title: "",
        logoutActive: false,
        subTitle: "ACTUALIZAR CONTRASEÑA",
      ),
      bodySliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstColors.slgPrincipal.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75), // Color de la sombra
                    spreadRadius: -2,
                    blurRadius: 5,
                    offset: const Offset(1.5, 1.5),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppInputTextFormField(
                      label: 'Nueva contraseña',
                      controller: password1Controller,
                      validator: (value) => Validators.validateWithMultiple(
                        [
                          Validators.validateNotEmpty,
                          (subValue) => Validators.validateMinLength(subValue, 8),
                        ],
                        value,
                      ),
                    ),
                    AppInputTextFormField(
                      label: 'Confirmar contraseña',
                      controller: password2Controller,
                      validator: (value) => Validators.validateWithMultiple(
                        [
                          Validators.validateNotEmpty,
                          (subValue) => Validators.validateMinLength(subValue, 8),
                        ],
                        value,
                      ),
                    ),
                    AppBox.h10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonSuccess(
                        text: 'Aceptar',
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            if (password1Controller.text != password2Controller.text) {
                              dialogMessageCubit.showErrorAlert(texto: 'Las contraseñas no coinciden');
                              return;
                            }
                            loginBloc.add(LoginEvent.updatePassword(UpdatePasswordRequestDataModel(password1: password1Controller.text, password2: password2Controller.text)));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppBox.h10,
            AppTextGlobal.labelLightText(text: 'Recomendaciones:'),
            AppBox.h12,
            AppTextGlobal.miniText(text: '1. Longitud mínima de 8 caracteres.'),
            AppTextGlobal.miniText(text: '2. Incluir al menos una letra mayúscula, una minúscula, un número y un símbolo especial.', maxLines: 2),
            AppTextGlobal.miniText(text: '3. No reutilizar contraseñas usadas en otras cuentas.', maxLines: 2),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildMobile(context);
  }
}
