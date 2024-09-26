import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeLight() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppConstColors.blueAccent,
          onPrimary: AppConstColors.lightGray,
          onSurface: AppConstColors.blueSecondary,
        ));
  }

  ThemeData themeDark() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppConstColors.blueSecondary,
          onPrimary: AppConstColors.lightGray,
          onSurface: AppConstColors.blueSecondary,
        ));
  }
}
