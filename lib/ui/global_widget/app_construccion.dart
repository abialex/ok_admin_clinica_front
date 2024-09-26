import 'package:admin_clinica_front/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class ConstruccionAnimated extends StatelessWidget {
  const ConstruccionAnimated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: AppConstColors.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppConstSvgs.construccion_worker,
            height: 120,
          )
              .animate(
                onPlay: (controller) => controller.loop(reverse: true),
              )
              .scale(
                begin: const Offset(0.9, 0.9),
                curve: Curves.bounceOut,
                duration: 1.5.seconds,
              ),
          AppTextGlobal.labelLargeText(text: "¡EN CONSTRUCCIÓN!")
              .animate(
                onPlay: (controller) => controller.loop(),
              )
              .shake(
                hz: 2,
                duration: 1.seconds,
                delay: 1.seconds,
                rotation: 0.02,
              ),
          SvgPicture.asset(
            AppConstSvgs.construction_svgrepo,
            height: 120,
          )
              .animate(
                onPlay: (controller) => controller.loop(reverse: true),
              )
              .flip(
                duration: 1.seconds,
                begin: 1,
                delay: 2.seconds,
              ),
        ],
      ),
    );
  }
}
