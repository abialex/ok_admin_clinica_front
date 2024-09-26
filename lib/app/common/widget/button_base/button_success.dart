import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

import 'button_base.dart';

class ButtonSuccess extends StatelessWidget {
  final String text;
  final double? height;
  final void Function()? onClick;
  const ButtonSuccess({
    super.key,
    required this.text,
    this.height,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustomBase(
      onClick: onClick,
      text: text,
      height: height,
      backgroundColor: AppConstColors.slg01,
      textColor: AppConstColors.white,
    );
  }
}
