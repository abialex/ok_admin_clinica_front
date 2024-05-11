import 'package:flutter/widgets.dart';

import '../../../core/utils/app_colors.dart';
import 'app_text_base.dart';

class AppTextFontNormal extends StatelessWidget {
  final String text;
  const AppTextFontNormal({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextBase(
      text: text,
      fontSize: 14.5,
      fontWeight: FontWeight.normal,
      colorText: AppColors.blueAccent,
    );
  }
}
