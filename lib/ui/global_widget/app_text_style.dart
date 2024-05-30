import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class _BaseText {
  static Text lightText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines ?? 1,
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
        overflow: TextOverflow.ellipsis,
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

class AppTextGlobal {
  // *: BASE PARA EL APP
  static Text lightText({required String text, int? maxLines, double? fontSize, Color colorText = AppColors.dark}) => _BaseText.lightText(
        text: text,
        color: colorText,
        maxLines: maxLines,
        fontSize: fontSize,
      );
  static Text mediumText({required String text}) => _BaseText.mediumText(
        text: text,
        color: AppColors.blueSecondary,
      );

  static Text largeText({required String text}) => _BaseText.largeText(
        text: text,
        color: AppColors.blueSecondary,
      );

  static Text labelLightText({
    required String text,
    double? fontSize,
    Color colorText = AppColors.dark,
    TextAlign? textAlign,
  }) =>
      _BaseText.lightText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        fontSize: fontSize,
        textAlign: textAlign,
      );

  static Text labelSmallText({required String text, FontWeight fontWeight = FontWeight.bold, Color colorText = AppColors.blueSecondary}) => _BaseText.lightText(
        text: text,
        fontWeight: fontWeight,
        color: colorText,
        fontSize: 12,
      );

  static Text labelMediumText({required String text, Color colorText = AppColors.blueSecondary}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
      );

  static Text labelLargeText({required String text, Color colorText = AppColors.dark}) => _BaseText.largeText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
      );

  static Text titleText({required String text}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.blueSecondary,
      );

  static Text errorlightText({required String text, int maxLines = 1}) => _BaseText.lightText(
        text: text,
        color: AppColors.redAccent,
        fontSize: 13,
        maxLines: maxLines,
      );
  // *: ESPECIALIZADO PARA EL APP
  static Text nameText({required String text}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.dark,
        fontSize: 20,
      );
  static Text dateText({required String text}) => _BaseText.mediumText(
        text: text,
        color: AppColors.darkGray,
        fontSize: 19,
      );
}
