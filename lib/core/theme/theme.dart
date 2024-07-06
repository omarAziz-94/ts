import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';

class AppTheme {
  static final themeData = ThemeData(
    primaryColor: AppColors.primary,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: AppColors.white),
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.white),
    textTheme: const TextTheme(
      headline4: TextStyle(color: AppColors.textPrimary, fontSize: 36),
      headline5: TextStyle(color: AppColors.textPrimary, fontSize: 30),
      headline6: TextStyle(color: AppColors.textPrimary, fontSize: 24),
      subtitle1: TextStyle(color: AppColors.textPrimary, fontSize: 20),
      bodyText1: TextStyle(color: AppColors.textPrimary, fontSize: 18),
      subtitle2: TextStyle(color: AppColors.textPrimary, fontSize: 17),
      bodyText2: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      button: TextStyle(color: AppColors.textButton, fontSize: 15),
      caption: TextStyle(color: AppColors.textPrimary, fontSize: 14),
      labelMedium: TextStyle(color: AppColors.textPrimary, fontSize: 13),
      overline: TextStyle(color: AppColors.textPrimary, fontSize: 12),

    ),
  );
}
