import 'package:admin_clinica_front/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstColors.slg01.withOpacity(0.6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              // alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    // height: 100,
                    width: 100,
                    child: SvgPicture.asset(
                      AppConstSvgs.logo,
                      height: 100,
                      width: 100,
                      color: AppConstColors.slgPrincipal,
                    ),
                  ),
                ).animate(onPlay: (controller) => controller.loop(reverse: true)).scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                      delay: 1.seconds,
                      duration: 1.5.seconds,
                      curve: Curves.bounceOut,
                    ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: CircularProgressIndicator(
                    // strokeAlign: 20,
                    strokeWidth: 10,
                    backgroundColor: AppConstColors.white,
                    color: AppConstColors.slg04,
                  ),
                ),
              ],
            ),
            AppBox.h20,
            AppTextGlobal.labelLargeText(text: "Cargando...")
                .animate(
                  onPlay: (controller) => controller.loop(),
                )
                .custom(
                  duration: 3.seconds,
                  builder: (context, value, child) {
                    return AppTextGlobal.labelLargeText(
                        text: () {
                          if (value < 0.2) {
                            return ("Cargando");
                          } else if (value < 0.5) {
                            return ("Cargando.");
                          } else if (value < 0.8) {
                            return ("Cargando..");
                          } else {
                            return ("Cargando...");
                          }
                        }(),
                        colorText: AppConstColors.white);
                  },
                )
          ],
        ),
      ),
    );
  }
}

class LoaderCubit extends Cubit<bool> {
  LoaderCubit() : super(false);

  void show() {
    emit(true);
  }

  void hidden() {
    emit(false);
  }
}
