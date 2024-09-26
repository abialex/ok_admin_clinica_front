import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
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
    Color colorText = AppConstColors.dark,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) =>
      _BaseText.lightText(
        text: text,
        color: colorText,
        maxLines: maxLines,
        fontSize: fontSize,
        textAlign: textAlign,
        fontWeight: fontWeight,
      );
  static Text mediumText({
    required String text,
    Color colorText = AppConstColors.dark,
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
        color: AppConstColors.blueSecondary,
      );

  static Text labelLightText({
    required String text,
    double? fontSize,
    Color colorText = AppConstColors.dark,
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
    Color colorText = AppConstColors.dark,
    TextAlign? textAlign,
    double? fontSize,
    int? maxLines,
  }) =>
      _BaseText.lightText(
        text: text,
        fontWeight: fontWeight,
        color: colorText,
        fontSize: fontSize ?? 12,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  static Text labelMediumText({required String text, Color colorText = AppConstColors.dark, int maxLines = 1, TextAlign? textAlign, double? fontSize}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: colorText,
        textAlign: textAlign,
        fontSize: fontSize,
        maxLines: maxLines,
      );

  static Text labelLargeText({
    required String text,
    Color colorText = AppConstColors.dark,
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
        color: AppConstColors.blueSecondary,
      );

  static Text errorlightText({required String text, int maxLines = 1, TextAlign? textAlign}) => _BaseText.lightText(
        text: text,
        color: AppConstColors.redAccent,
        fontSize: 13,
        maxLines: maxLines,
        textAlign: textAlign,
      );

  static Text successlightText({required String text, int maxLines = 1}) => _BaseText.lightText(
        text: text,
        color: AppConstColors.greenAccent,
        fontSize: 13,
        maxLines: maxLines,
      );
  // *: ESPECIALIZADO PARA EL APP
  static Text nameText({required String text}) => _BaseText.mediumText(
        text: text,
        fontWeight: FontWeight.bold,
        color: AppConstColors.dark,
        fontSize: 20,
      );
  static Text dateText({required String text}) => _BaseText.mediumText(
        text: text,
        color: AppConstColors.darkGray,
        fontSize: 19,
      );
}
