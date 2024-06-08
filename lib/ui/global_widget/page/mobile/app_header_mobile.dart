import 'package:admin_clinica_front/core/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/dominio/services/local_service.dart';
import 'package:admin_clinica_front/ui/core/router.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/view_models/usuario_view/usuario_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HeaderMobile extends StatelessWidget {
  final String? subTitle;
  final String title;
  final bool logoutActive;
  const HeaderMobile({
    super.key,
    this.subTitle,
    required this.title,
    this.logoutActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final auth = locator<LocalService>();
    final dialog = context.read<DialogMessageCubit>();
    return Container(
      // color: AppColors.white,
      padding: const EdgeInsets.only(top: 5, right: 12.5, left: 12.5),
      decoration: const BoxDecoration(
        color: AppColors.slgPrincipal,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder<UsuarioLoginResponseViewModel?>(
                    future: auth.getUsuario(),
                    builder: (BuildContext context, AsyncSnapshot<UsuarioLoginResponseViewModel?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextGlobal.labelLightText(
                              text: snapshot.data?.nombres ?? "- -",
                              fontSize: 14,
                              colorText: AppColors.darkFillColor,
                            ),
                            AppTextGlobal.labelSmallText(
                              text: "${snapshot.data?.rol ?? "- -"}  ${snapshot.data?.tipo ?? ""}",
                              fontWeight: FontWeight.w600,
                              colorText: AppColors.darkFillColor,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
              Positioned(
                right: 25,
                top: 10,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (logoutActive) {
                          dialog.showConfirmationAlert(
                            texto: "¿Seguro de cerrar sesión?",
                            onAceptar: () {
                              final navbarCubit = context.read<NavigatorCubit>();
                              navbarCubit.updateIndexDelay(1);
                              Navigator.pushReplacementNamed(context, Routes.login);
                            },
                          );
                        }
                      },
                      child: SvgPicture.asset(
                        AppConstSvgs.logo,
                        color: AppColors.white,
                        height: 35,
                      ).animate().rotate(end: 0.5),
                    ),
                    AppBox.h8,
                    SvgPicture.asset(
                      AppConstSvgs.logo_string,
                      color: AppColors.darkFillColor,
                      height: 15,
                      // width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppBox.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextGlobal.labelMediumText(text: title, colorText: AppColors.white).animate().scale(curve: Curves.bounceOut, begin: Offset(0.6, 0.6)),
            ],
          )
        ],
      ),
    );
  }
}
