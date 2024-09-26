import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/config/routes/router.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/loader/app_loader_text_jump_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PreviewSLG extends StatelessWidget {
  const PreviewSLG({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: 1.75.seconds,
      child: Container(
        alignment: Alignment.center,
        color: AppConstColors.white.withOpacity(0.97),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AppLoaderTextJumpAnimate(
                message: "Bienvenido nuevamente!",
                heightJump: 2.5,
                buildText: (value) {
                  return AppTextGlobal.labelMediumText(text: value);
                },
              ),
            ),
            AppBox.h40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ButtonSuccess(
                text: "Ingresar",
                onClick: () {
                  Navigator.pushReplacementNamed(context, Routes.home);
                },
              ),
            ),
            AppBox.h20,
          ],
        ),
      ),
    );
  }
}
