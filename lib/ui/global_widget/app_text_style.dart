import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ConstTextGlobal {
  static Text lightText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      softWrap: true,
      maxLines: 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text mediumText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        fontSize: fontSize ?? 21,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  static Text largeText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 31,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class ConstTextApp {
  static Text lightText({required String text}) => ConstTextGlobal.lightText(
        text: text,
        color: AppColors.blueSecondary,
      );
  static Text mediumText({required String text}) => ConstTextGlobal.mediumText(
        text: text,
        color: AppColors.blueSecondary,
      );

  static Text largeText({required String text}) => ConstTextGlobal.largeText(
        text: text,
        color: AppColors.blueSecondary,
      );

  static Text labelText({required String text}) => ConstTextGlobal.lightText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.blueSecondary,
      );
  static Text nameText({required String text}) => ConstTextGlobal.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.dark,
        fontSize: 20,
      );
  static Text dateText({required String text}) => ConstTextGlobal.mediumText(
        text: text,
        color: AppColors.darkGray,
        fontSize: 19,
      );

  static Text titleText({required String text}) => ConstTextGlobal.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.blueSecondary,
      );

  static Text lightTextError({required String text}) => ConstTextGlobal.lightText(
        text: text,
        color: AppColors.redAccent,
        fontSize: 12,
      );
}
