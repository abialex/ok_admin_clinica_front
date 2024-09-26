import 'package:admin_clinica_front/common/constants/app_const_name.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppDetailsReleaseWidget extends StatelessWidget {
  const AppDetailsReleaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextGlobal.labelSmallText(
          text:
              "${dotenv.env[AppConstName.app_name] ?? '- -'} v${dotenv.env[AppConstName.version] ?? '- -'} ${dotenv.env[AppConstName.last_update_date] ?? '- -'} - ${dotenv.env[AppConstName.enviroment] ?? '- -'}",
          colorText: AppConstColors.grey,
          textAlign: TextAlign.left,
          fontSize: 6,
        ),
      ],
    );
  }
}
