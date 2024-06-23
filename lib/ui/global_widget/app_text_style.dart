import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _BaseText {
  static Text lightText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? textOverflow,
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
      overflow: textOverflow ?? TextOverflow.ellipsis,
    );
  }

  static Text mediumText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines ?? 1,
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
  static Text lightText({
    required String text,
    int? maxLines,
    double? fontSize,
    Color colorText = AppColors.dark,
    TextAlign? textAlign,
  }) =>
      _BaseText.lightText(
        text: text,
        color: colorText,
        maxLines: maxLines,
        fontSize: fontSize,
        textAlign: textAlign,
      );
  static Text mediumText({
    required String text,
    Color colorText = AppColors.dark,
    int maxLines = 1,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) =>
      _BaseText.mediumText(
        text: text,
        color: colorText,
        maxLines: maxLines,
        textAlign: textAlign,
        fontWeight: fontWeight,
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
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int maxLines = 1,
  }) =>
      _BaseText.lightText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        fontSize: fontSize,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
      );

  static Text labelSmallText({
    required String text,
    FontWeight fontWeight = FontWeight.bold,
    Color colorText = AppColors.dark,
    TextAlign? textAlign,
    double? fontSize,
  }) =>
      _BaseText.lightText(
        text: text,
        fontWeight: fontWeight,
        color: colorText,
        fontSize: fontSize ?? 12,
        textAlign: textAlign,
      );

  static Text labelMediumText({required String text, Color colorText = AppColors.dark, int maxLines = 1, TextAlign? textAlign}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        textAlign: textAlign,
      );

  static Text labelLargeText({
    required String text,
    Color colorText = AppColors.dark,
    TextAlign? textAlign,
  }) =>
      _BaseText.largeText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        textAlign: textAlign,
      );

  static Text titleText({required String text}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppColors.blueSecondary,
      );

  static Text errorlightText({required String text, int maxLines = 1, TextAlign? textAlign}) => _BaseText.lightText(
        text: text,
        color: AppColors.redAccent,
        fontSize: 13,
        maxLines: maxLines,
        textAlign: textAlign,
      );

  static Text successlightText({required String text, int maxLines = 1}) => _BaseText.lightText(
        text: text,
        color: AppColors.greenAccent,
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
