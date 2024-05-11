import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.blueAccent,
          onPrimary: AppColors.lightGray,
          onSurface: AppColors.blueSecondary,
        ));
  }
}
