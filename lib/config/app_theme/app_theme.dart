import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color primary = Color(0xFF0d3a2d);
  static final Color onPrimary = Color(0xFFf7fffd);
  static final Color secondary = Color(0xFFf1b002);
  static final Color onSecondary = Color(0xFFf4fff6);
  static final Color surface = Color(0xFFffffff);
  static final Color onSurface = Color(0xFF222222);
  static final Color error = Colors.redAccent;
  static final Color onError = Colors.white;

  static final Color ternaryColor = Color(0xFF6c9674);

  static final Color greyishColor = Color(0xFF8e8e8e);

  static final scaffoldColor = Color(0xFFffffff);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldColor,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.onPrimary),
    ),
  );
}
