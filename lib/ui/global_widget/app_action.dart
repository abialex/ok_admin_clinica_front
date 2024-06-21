import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ActionWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  const ActionWidget({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor = AppColors.slg01,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextGlobal.labelLightText(text: text, colorText: AppColors.white),
          AppBox.w2,
          Icon(
            icon,
            color: AppColors.white,
            size: 25,
          )
              .animate(
                onPlay: (controller) => controller.loop(reverse: true),
              )
              .shake(delay: 1.seconds, duration: 1.seconds),
        ],
      ),
    );
  }
}
