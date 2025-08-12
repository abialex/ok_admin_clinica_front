import 'package:admin_clinica_front/app/common/constants/app_const_name.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppDetailsReleaseWidget extends StatelessWidget {
  const AppDetailsReleaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final platform = snapshot.data!;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextGlobal.labelSmallText(
                text: "${platform.appName} v${platform.version} ${dotenv.env[AppConstName.enviroment] ?? '- -'}",
                colorText: AppConstColors.grey,
                textAlign: TextAlign.left,
                fontSize: 9,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
