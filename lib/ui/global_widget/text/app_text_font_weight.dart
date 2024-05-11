import 'package:flutter/widgets.dart';

import '../../../core/utils/app_colors.dart';
import 'app_text_base.dart';

class AppTextFontWeight extends StatelessWidget {
  final String text;
  const AppTextFontWeight({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextBase(
      text: text,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      colorText: AppColors.blueSecondary,
    );
  }
}
