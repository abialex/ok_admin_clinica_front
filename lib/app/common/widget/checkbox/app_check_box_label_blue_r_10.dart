import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/checkbox/custom_label_check_box_r_10.dart';
import 'package:flutter/material.dart';

class CheckBoxLabelBlueR10 extends StatelessWidget {
  const CheckBoxLabelBlueR10({
    required this.onChanged,
    super.key,
    this.value,
    this.text,
    this.fontSize,
  });
  final void Function() onChanged;
  final bool? value;
  final String? text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return CustomLabelCheckBoxR10(
      onChanged: onChanged,
      backgroundColor: AppConstColors.blueAccent,
      iconBackgroundColor: AppConstColors.white,
      text: text,
      value: value,
      fontSize: fontSize,
    );
  }
}
